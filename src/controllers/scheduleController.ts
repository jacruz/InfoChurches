import { Request, Response } from "express";
const db = require('../models/index');

export class ScheduleController {

  public getAllSchedules = async (req:Request, res:Response) => {
    try { 
      const schedule = await db.Schedule.findAll();
      res.status(200).send(schedule);
    } catch (error:any) {
      console.error(error);
      res.status(500).send("Error");
    }
  };

  public getOneSchedule = async (req:Request, res:Response) => {
    try { 
      const {id} = req.params;
      const schedule = await db.Schedule.findByPk(id);
      if(schedule){
        res.status(200).send(schedule);
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

  public createSchedule = async (req:Request, res:Response) => {
    try {
      const schedule = await db.Schedule.create(req.body);
      if (schedule) {
        console.log("Schedule Created " + schedule.ID_SCHEDULE);
        res.status(201).send({status: true, id: schedule.ID_SCHEDULE});
      }
    } catch (error:any) {
      console.error(error);
      res.status(500).send("Error");
    }
  };

  public updateSchedule = async (req:Request, res:Response) => {
    try {
      const {id} = req.params;
      const data = {...req.body};

      delete data.id;

      const schedule = await db.Schedule.update(data,{
        where: {
          ID_SCHEDULE: id
        }
      });

      if (typeof (schedule[0]) !== 'undefined' && schedule[0] === 1) {
        res.status(201).send({
          status: true, id: id
        });
        console.log("Schedule Updated " + id);
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
  public deleteSchedule = async (req:Request, res:Response) => {
    try {
      const {id} = req.params;
      const schedule = await db.Schedule.destroy({
        where: {
          ID_SCHEDULE: id
        }
      });

      if (schedule) {
        res.status(201).send({
          status: true, id: id
        });
        console.log("Schedule Deleted " + id);
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