import { Request, Response } from "express";
const db = require('../models/index');

export class DomainController{
  
  public getAllDomains = async (req:Request, res:Response) => {
    try { 
      const domains = await db.Domain.findAll()
      res.status(200).send(domains);
    } catch (error:any) {
      console.error(error);
      res.status(500).send("Error");
    }
  };
  
  public getOneDomain = async (req:Request, res:Response) => {
    try { 
      const {id} = req.params;
      const domain = await db.Domain.findByPk(id);
      if(domain){
        res.status(200).send(domain);
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
  
  public createDomain = async (req:Request, res:Response) => {
    try {
      const domain = await db.Domain.create(req.body);
      if (domain) {
        console.log("Domain Created " + domain.ID_DOMAIN);
        res.status(201).send({status: true, id: domain.ID_DOMAIN});
      }
    } catch (error:any) {
      console.error(error);
      res.status(500).send(error);
    }
  };
  
  public updateDomain = async (req:Request, res:Response) => {
    try {
      const {id} = req.params;
      const data = {...req.body};
  
      delete data.id;
  
      const domain = await db.Domain.update(data,{
        where: {
          ID_DOMAIN: id
        }
      });
  
      if (typeof (domain[0]) !== 'undefined' && domain[0] === 1) {
        res.status(201).send({
          status: true, id: id
        });
        console.log("Domain Updated " + id);
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
  public deleteDomain = async (req:Request, res:Response) => {
    try {
      const {id} = req.params;
      const domain = await db.Domain.destroy({
        where: {
          ID_DOMAIN: id
        }
      });
  
      if (domain) {
        res.status(201).send({
          status: true, id: id
        });
        console.log("Domain Deleted " + id);
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