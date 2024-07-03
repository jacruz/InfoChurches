import { Request, Response } from "express";
const db = require('../models/index');

export class DomainValueController {
    
  public getAllDomainValues = async (req:Request, res:Response) => {
    try { 
        const domainValues = await db.DomainValue.findAll();
        res.status(200).send(domainValues);
      } catch (error:any) {
        console.error(error);
        res.status(500).send(
          {message: error.message || 'Error getting domainValues'},
        );
    }
  };

  public getOneDomainValues = async (req:Request, res:Response) => {
    try { 
      const {id} = req.params;
      const domainValue = await db.DomainValue.findByPk(id);
      if(domainValue){
        res.status(200).send(domainValue);
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
  
  
  public createDomainValues = async (req:Request, res:Response) => {
    try {
      const domainValue = await db.DomainValue.create(req.body);
      if (domainValue) {
        console.log("Domain Created " + domainValue.ID_DOMAIN_VALUE);
        res.status(201).send({status: true, id: domainValue.ID_DOMAIN_VALUE});
      }
    } catch (error:any) {
      console.error(error);
      res.status(500).send("Error");
    }
  };

  public updateDomainValues = async (req:Request, res:Response) => {
    try {
      const {id} = req.params;
      const data = {...req.body};

      delete data.id;

      const domainValue = await db.DomainValue.update(data,{
        where: {
          ID_DOMAIN_VALUE: id
        }
      });

      if (typeof (domainValue[0]) !== 'undefined' && domainValue[0] === 1) {
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
  public deleteDomainValues = async (req:Request, res:Response) => {
    try {
      const {id} = req.params;
      const domainValue = await db.DomainValue.destroy({
        where: {
          ID_DOMAIN_VALUE: id
        }
      });

      if (domainValue) {
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