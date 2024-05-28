const db = require('../models/index');

const getAllDomains = async (req, res) => {
  try { 
    const domains = await db.Domain.findAll()
    res.status(200).send(domains);
  } catch (error) {
    console.error(error);
    res.status(500).send("Error");
  }
};

const getOneDomain = async (req, res) => {
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
  } catch (error) {
    console.error(error);
    res.status(500).send("Error");
  }
};

const createDomain = async (req, res) => {
  try {
    const domain = await db.Domain.create(req.body);
    if (domain) {
      console.log("Domain Created " + domain.ID_DOMAIN);
      res.status(201).send({status: true, id: domain.ID_DOMAIN});
    }
  } catch (error) {
    console.error(error);
    res.status(500).send(error);
  }
};

const updateDomain = async (req, res) => {
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
  } catch (error) {
    console.error(error);
    res.status(500).send(
        {message: error.message || 'Error updating'},
    );
  }
};
const deleteDomain = async (req, res) => {
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
  } catch (error) {
    console.error(error);
    res.status(500).send(
        {message: err.message || 'Error deleting'},
    );
  }
};

module.exports = { getAllDomains, getOneDomain, createDomain, updateDomain, deleteDomain };