const db = require('../models/index');

const getAllLocations = async (req, res) => {
  try { 
    const locations = await db.Location.findAll()
    res.status(200).send(locations);
  } catch (error) {
    console.error(error);
    res.status(500).send("Error");
  }
};

const getOneLocation = async (req, res) => {
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
  } catch (error) {
    console.error(error);
    res.status(500).send("Error");
  }
};

const createLocation = async (req, res) => {
  try {
    const location = await db.Location.create(req.body);
    if (location) {
      console.log("Location Created " + location.ID_LOCATION);
      res.status(201).send({status: true, id: location.ID_LOCATION});
    }
  } catch (error) {
    console.error(error);
    res.status(500).send(error);
  }
};

const updateLocation = async (req, res) => {
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
  } catch (error) {
    console.error(error);
    res.status(500).send(
        {message: error.message || 'Error updating'},
    );
  }
};
const deleteLocation = async (req, res) => {
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
  } catch (error) {
    console.error(error);
    res.status(500).send(
        {message: error.message || 'Error deleting'},
    );
  }
};

module.exports = { getAllLocations, getOneLocation, createLocation, updateLocation, deleteLocation };