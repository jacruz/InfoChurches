import { Request, Response } from "express";
const db = require('../models/index');

export class LocationController {

  public getAllLocations = async (req:Request, res:Response) => {
    try { 
      const locations = await db.Location.findAll()
      res.status(200).send(locations);
    } catch (error:any) {
      console.error(error);
      res.status(500).send("Error");
    }
  };

  public getOneLocation = async (req:Request, res:Response) => {
    try { 
      const {id} = req.params;
      const location = await db.Location.findByPk(id);
      if(location){
        res.status(200).send(location);
      }else{
        res.status(404).send(
          {message: 'Not found'},
        );
      }
    } catch (error:any) {
      console.error(error);
      res.status(500).send("Error");
    }
  };

  public createLocation = async (req:Request, res:Response) => {
    try {
      const location = await db.Location.create(req.body);
      if (location) {
        console.log("Location Created " + location.ID_LOCATION);
        res.status(201).send({status: true, id: location.ID_LOCATION});
      }
    } catch (error:any) {
      console.error(error);
      res.status(500).send(error);
    }
  };

  public updateLocation = async (req:Request, res:Response) => {
    try {
      const {id} = req.params;
      const data = {...req.body};

      delete data.id;

      const location = await db.Location.update(data,{
        where: {
          ID_LOCATION: id
        }
      });

      if (typeof (location[0]) !== 'undefined' && location[0] === 1) {
        res.status(201).send({
          status: true, id: id
        });
        console.log("Location Updated " + id);
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
  public deleteLocation = async (req:Request, res:Response) => {
    try {
      const {id} = req.params;
      const location = await db.Location.destroy({
        where: {
          ID_LOCATION: id
        }
      });

      if (location) {
        res.status(201).send({
          status: true, id: id
        });
        console.log("Location Deleted " + id);
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

}