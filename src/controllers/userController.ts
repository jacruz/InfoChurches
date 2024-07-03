import { Request, Response } from "express";
const db = require('../models/index');

export class UserController {

  public getAllUsers = async (req:Request, res:Response) => {
    try { 
      const users = await db.User.findAll()
      res.status(200).send(users);
    } catch (error:any) {
      console.error(error);
      res.status(500).send("Error");
    }
  };

  public getOneUser = async (req:Request, res:Response) => {
    try { 
      const {id} = req.params;
      const user = await db.User.findByPk(id);
      if(user){
        res.status(200).send(user);
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

  public createUser = async (req:Request, res:Response) => {
    try {
      const user = await db.User.create(req.body);
      if (user) {
        console.log("User Created " + user.ID_USER);
        res.status(201).send({status: true, id: user.ID_USER});
      }
    } catch (error:any) {
      console.error(error);
      res.status(500).send(error);
    }
  };

  public updateUser = async (req:Request, res:Response) => {
    try {
      const {id} = req.params;
      const data = {...req.body};

      delete data.id;

      const user = await db.User.update(data,{
        where: {
          ID_USER: id
        }
      });

      if (typeof (user[0]) !== 'undefined' && user[0] === 1) {
        res.status(201).send({
          status: true, id: id
        });
        console.log("User Updated " + id);
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
  public deleteUser = async (req:Request, res:Response) => {
    try {
      const {id} = req.params;
      const user = await db.User.destroy({
        where: {
          ID_USER: id
        }
      });

      if (user) {
        res.status(201).send({
          status: true, id: id
        });
        console.log("User Deleted " + id);
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