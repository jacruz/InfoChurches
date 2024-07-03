import { Request, Response } from "express";
const db = require('../models/index');

export class LinkController {

  public getAllLinks = async (req:Request, res:Response) => {
    try { 
      const links = await db.Link.findAll()
      res.status(200).send(links);
    } catch (error:any) {
      console.error(error);
      res.status(500).send("Error");
    }
  };

  public getOneLink = async (req:Request, res:Response) => {
    try { 
      const {id} = req.params;
      const link = await db.Link.findByPk(id);
      if(link){
        res.status(200).send(link);
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

  public createLink = async (req:Request, res:Response) => {
    try {
      const link = await db.Link.create(req.body);
      if (link) {
        console.log("Link Created " + link.ID_LINK);
        res.status(201).send({status: true, id: link.ID_LINK});
      }
    } catch (error:any) {
      console.error(error);
      res.status(500).send(error);
    }
  };

  public updateLink = async (req:Request, res:Response) => {
    try {
      const {id} = req.params;
      const data = {...req.body};

      delete data.id;

      const link = await db.Link.update(data,{
        where: {
          ID_LINK: id
        }
      });

      if (typeof (link[0]) !== 'undefined' && link[0] === 1) {
        res.status(201).send({
          status: true, id: id
        });
        console.log("Link Updated " + id);
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
  public deleteLink = async (req:Request, res:Response) => {
    try {
      const {id} = req.params;
      const link = await db.Link.destroy({
        where: {
          ID_LINK: id
        }
      });

      if (link) {
        res.status(201).send({
          status: true, id: id
        });
        console.log("Link Deleted " + id);
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