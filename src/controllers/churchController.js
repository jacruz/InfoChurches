const db = require('../models/index');
const constants = require("../data/constants");
const distanceCalculator = require("../utils/distanceCalculator");

const optionsFullChurch = {
  attributes: [['NAME','name'],['IMG','img'],['PRIEST_NAME','priest'],['DIRECTION','direction'],['LATITUDE','lat'],['LONGITUDE','lng'],['MOBILE','mobile_number'],['LANDLINE','landline_number'],['UPDATED_AT','last_updated']],
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
  ]
};

const getAllChurches = async (req, res) => {
  try { 
    const churches = await db.Church.findAll(optionsFullChurch);
    for(index in churches){
      churches[index] = formatChurch(churches[index]);
    }
    res.status(200).send(churches);
  } catch (error) {
    console.error(error);
    res.status(500).send("Error");
  }
};

const getOneChurch = async (req, res) => {
  try { 
    const {id} = req.params;
    const church = await db.Church.findByPk(id,optionsFullChurch);
    if(church){
      let churchRes = formatChurch(church);
      res.status(200).send(churchRes);
    }else{
      res.status(404).send(
        {message: 'Not found'},
      );
    }
  } catch (error) {
    console.error(error);
    res.status(500).send("Error");
  }
};

const createChurch = async (req, res) => {
  try {
    const church = await db.Church.create(req.body);
    if (church) {
      console.log("Church Created " + church.ID_CHURCH);
      res.status(201).send({status: true, id: church.ID_CHURCH});
    }
  } catch (error) {
    console.error(error);
    res.status(500).send(error);
  }
};

const updateChurch = async (req, res) => {
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
  } catch (error) {
    console.error(error);
    res.status(500).send(
        {message: error.message || 'Error updating'},
    );
  }
};
const deleteChurch = async (req, res) => {
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
  } catch (error) {
    console.error(error);
    res.status(500).send(
        {message: error.message || 'Error deleting'},
    );
  }
};

function formatChurch(church){
  let cdv = church.dataValues;
  let churchRes = {
    name : cdv.name,
    img : cdv.img,
    priest : cdv.priest,
    location : {
      direction : cdv.direction,
      country : getLocations(cdv.Location, constants.DOM_VAL_COUNTRY),
      city : getLocations(cdv.Location, constants.DOM_VAL_CITY),
      sector : getLocations(cdv.Location, constants.DOM_VAL_SECTOR),
      lat : cdv.lat,
      lng : cdv.lng,
      distance : {
        origin:{
          lat:"4.643829",
          lng:"-74.175382",
        },
        value:distanceCalculator.getDistanceFromLatLonInKm(Number("4.643829"),Number("-74.175382"),Number(cdv.lat),Number(cdv.lng))
      }
    },
    contact : {
      mobile_number : cdv.mobile_number,
      landline_number : cdv.landline_number,
      links : getLinks(cdv.Link)
    },
    schedules: getschedules(cdv.Schedule)
  };

  churchRes = cleanJSON(churchRes,true);
  return churchRes;
}


  //Llamada recursiva a location
  function getLocations(location, domainValueLocation){
    let locRes = null;
    if(domainValueLocation == location.DomainValue.NAME){
      locRes = location.dataValues.name;
    }
    if(locRes === null && location.Location != undefined){
      return getLocations(location.Location, domainValueLocation);
    }
    return locRes;
  }

  function getLinks(links){
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

  function getschedules(schedules){
    let schedulesRes = [];
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
        let daysIndexTmp = schedule.value.findIndex( scheName => scheName.days_of_week==dayOfWeek );
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
          schedule.value[daysIndexTmp].times.sort((t1,t2) => {
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

  function cleanJSON(test, recurse) {
    for (var i in test) {
        if (test[i] === null) {
            delete test[i];
        } else if (recurse && typeof test[i] === 'object') {
          cleanJSON(test[i], recurse);
        }
    }
    return test;
  }



module.exports = { getAllChurches, getOneChurch, createChurch, updateChurch, deleteChurch };