import { Request, Response } from "express";
import { DistanceCalculator } from "../utils/distanceCalculator";
import { Op } from "sequelize";
import { Constants } from "../data/constants";

const db = require('../models/index');

export class ChurchController {

  distanceCalculator = new DistanceCalculator();

  optionsFullChurch = {
    attributes: [['NAME','name'],['IMG','img'],['PRIEST_NAME','priest'],['DIRECTION','direction'],['LATITUDE','lat'],['LONGITUDE','lon'],['MOBILE','mobile_number'],['LANDLINE','landline_number'],['UPDATED_AT','last_updated']],
    include:[
      {
        model: db.Link,
        as: 'Link',
        attributes: [['VALUE','value']],
        include: [{
          model: db.DomainValue,
          as: 'DomainValue',
          attributes: [['NAME','name']],
        }],
      },
      {
        model: db.Schedule,
        as: 'Schedule',
        attributes: [['START_TIME','start_time'],['END_TIME','end_time'],['COMMENTS','comments']],
        include: [{
          model: db.DomainValue,
          as: 'domain_schedule',
          attributes: [['NAME','name']],
        },
        {
          model: db.DomainValue,
          as: 'domain_day_of_week',
          attributes: [['NAME','name']],
        }],
      },
      {
        model: db.Location,
        as: 'Location',
        attributes: [['NAME','name']],
        include: [
          {
            model: db.DomainValue,
            as: 'DomainValue',
            //attributes: [['NAME','name']],
          },
          {
            model: db.Location,
            as: 'Location',
            attributes: [['NAME','name']],
            include: [
              {
                model: db.DomainValue,
                as: 'DomainValue',
                //attributes: [['NAME','name']],
              },
              {
                model: db.Location,
                as: 'Location',
                attributes: [['NAME','name']],
                include: [
                  {
                    model: db.DomainValue,
                    as: 'DomainValue',
                    //attributes: [['NAME','name']],
                  }
                ],
              }
            ],
          }
        ],
      }
    ],
    where:{}
  };

  public getChurchesNeaby = async (req: Request, res: Response) => {
    try {
      const lat = req.query.lat as string;
      const lon = req.query.lon as string;
      const distance = req.query.distance as string;
      const boundingBox = this.distanceCalculator.getBoundingBox(Number(lat),Number(lon),Number(distance));
      this.optionsFullChurch.where={
        [Op.and]: [
          {
            LATITUDE: {
              [Op.lt]: boundingBox.northwest.lat
            }
          },
          {
            LONGITUDE: {
              [Op.gt]: boundingBox.northwest.lon
            }
          },
          {
            LATITUDE: {
              [Op.gt]: boundingBox.southeast.lat
            }
          },
          {
            LONGITUDE: {
              [Op.lt]: boundingBox.southeast.lon
            }
          },
        ]
      };
      const churches = await db.Church.findAll(this.optionsFullChurch);
      if(churches.length>0){
        churches.forEach((element: any, index: number) => {
          churches[index] = this.formatChurch(churches[index],lat,lon);
        });
        res.status(200).send(churches);
      }else{
        res.status(404).send(
          {message: 'No churches found nearby'},
        );
      }
    } catch (error:any) {
      console.error(error);
      res.status(500).send(
        {message: error.message || 'Error getting churches nearby'},
      );
    }
  };
  
  public getOneChurch = async (req:Request, res:Response) => {
    try { 
      let {id} = req.params;
      const church = await db.Church.findByPk(id,this.optionsFullChurch);
      if(church){
        let churchRes = this.formatChurch(church);
        res.status(200).send(churchRes);
      }else{
        res.status(404).send(
          {message: 'Not found'},
        );
      }
    } catch (error:any) {
      console.error(error);
      res.status(500).send(
        {message: error.message || 'Error getting one church'},
      );
    }
  };
  
  public getAllChurches = async (req:Request, res:Response) => {
    try { 
      const churches = await db.Church.findAll();
      res.status(200).send(churches);
    } catch (error:any) {
      console.error(error);
      res.status(500).send(
        {message: error.message || 'Error getting churches'},
      );
    }
  };
  
  
  public createChurch = async (req:Request, res:Response) => {
    try {
      const church = await db.Church.create(req.body);
      if (church) {
        console.log("Church Created " + church.ID_CHURCH);
        res.status(201).send({status: true, id: church.ID_CHURCH});
      }
    } catch (error:any) {
      console.error(error);
      res.status(500).send(
        {message: error.message || 'Error creating'},
      );
    }
  };

  public updateChurch = async (req:Request, res:Response) => {
    try {
      const {id} = req.params;
      const data = {...req.body};

      delete data.id;

      const church = await db.Church.update(data,{
        where: {
          ID_CHURCH: id
        }
      });

      if (typeof (church[0]) !== 'undefined' && church[0] === 1) {
        res.status(201).send({
          status: true, id: id
        });
        console.log("Church Updated " + id);
      } else {
        res.status(404).send(
            {message: 'Not found'},
        );
      }
    } catch (error:any) {
      console.error(error);
      res.status(500).send(
          {message: error.message || 'Error updating'},
      );
    }
  };
  public deleteChurch = async (req:Request, res:Response) => {
    try {
      const {id} = req.params;
      const church = await db.Church.destroy({
        where: {
          ID_CHURCH: id
        }
      });

      if (church) {
        res.status(201).send({
          status: true, id: id
        });
        console.log("Church Deleted " + id);
      } else {
        res.status(404).send(
            {message: 'Not found'},
        );
      }
    } catch (error:any) {
      console.error(error);
      res.status(500).send(
          {message: error.message || 'Error deleting'},
      );
    }
  };

  public formatChurch(church:any,latOrigin?:string,lonOrigin?:string){
    let cdv = church.dataValues;
    let churchRes = {
      name : cdv.name,
      img : cdv.img,
      priest : cdv.priest,
      location : {
        direction : cdv.direction,
        country : this.getLocations(cdv.Location, Constants.DOM_VAL_COUNTRY),
        city : this.getLocations(cdv.Location, Constants.DOM_VAL_CITY),
        sector : this.getLocations(cdv.Location, Constants.DOM_VAL_SECTOR),
        lat : cdv.lat,
        lon : cdv.lon,
        distance : {}
      },
      contact : {
        mobile_number : cdv.mobile_number,
        landline_number : cdv.landline_number,
        links : this.getLinks(cdv.Link)
      },
      schedules: this.getschedules(cdv.Schedule)
    };

    if(latOrigin!==undefined){
      churchRes.location.distance = {
        origin:{
          lat:latOrigin,
          lon:lonOrigin,
        },
        value:this.distanceCalculator.getDistanceFromLatLonInKm(Number(latOrigin),Number(lonOrigin),Number(cdv.lat),Number(cdv.lon))
      }
    }
  
    churchRes = this.cleanJSON(churchRes,true);
    return churchRes;
  }
  
  
  //Llamada recursiva a location
  public getLocations(location:any, domainValueLocation:any):string{
    let locRes:string = "";
    if(domainValueLocation == location.DomainValue.NAME){
      locRes = location.dataValues.name;
    }
    if(locRes == "" && location.Location != undefined){
      return this.getLocations(location.Location, domainValueLocation);
    }
    return locRes;
  }

  public getLinks(links:any){
    let linksRes = [];
    for(let index in links){
      let linkTmp = {
        name : links[index].DomainValue.dataValues.name,
        value : links[index].dataValues.value
      };
      linksRes.push(linkTmp);
    }
    return linksRes;
  }

  public getschedules(schedules:any){
    let schedulesRes:any[] = [];
    for(let index in schedules){
      let name = schedules[index].domain_schedule.dataValues.name;
      let dayOfWeek = schedules[index].domain_day_of_week.dataValues.name;
      let schedule = schedulesRes.find( sche => sche.name==name ); //Si ya existe schedule por nombre asignarlo
      if(!schedule){//Schedule not found
        schedule = {
          name : name,
          value : [{
            days_of_week : dayOfWeek,
            times : [{
              start : schedules[index].dataValues.start_time,
              end : schedules[index].dataValues.end_time
            }],
            comments: schedules[index].dataValues.comments
          }]
        };
        schedulesRes.push(schedule);
      }else{//Schedule found
        let daysIndexTmp = schedule.value.findIndex( (scheName:any) => scheName.days_of_week==dayOfWeek );
        if(daysIndexTmp<0){//DayOfWeek not found
          let scheduleVal = {
            days_of_week : dayOfWeek,
            times : [{
              start : schedules[index].dataValues.start_time,
              end : schedules[index].dataValues.end_time,
              comments: schedules[index].dataValues.comments
            }],
          };
          schedule.value.push(scheduleVal);
        }else{//DayOfWeek found
          let time = {
            start : schedules[index].dataValues.start_time,
            end : schedules[index].dataValues.end_time,
            comments: schedules[index].dataValues.comments
          };
          schedule.value[daysIndexTmp].times.push(time);
          schedule.value[daysIndexTmp].times.sort((t1:any,t2:any) => {
            if(Number(t1.start.replace(":","")) < Number(t2.start.replace(":","")) ){
              return -1;
            }else{
              return 1;
            }
          });
        }
      }
      
    }
    return schedulesRes;
  }

  public cleanJSON(test:any, recurse:any) {
    for (var i in test) {
        if (test[i] === null) {
            delete test[i];
        } else if (recurse && typeof test[i] === 'object') {
          this.cleanJSON(test[i], recurse);
        }
    }
    return test;
  }

}