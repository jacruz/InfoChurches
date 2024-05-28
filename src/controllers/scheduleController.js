const db = require('../models/index');

const getAllSchedules = async (req, res) => {
  try { 
    const schedule = await db.Schedule.findAll({
      include:[
        {
          model: db.Schedule,
          as: 'Schedule'
        }
      ]
    })
    res.status(200).send(schedule);
  } catch (error) {
    console.error(error);
    res.status(500).send("Error");
  }
};

const getOneSchedule = async (req, res) => {
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
  } catch (error) {
    console.error(error);
    res.status(500).send("Error");
  }
};

const createSchedule = async (req, res) => {
  try {
    const schedule = await db.Schedule.create(req.body);
    if (schedule) {
      console.log("Schedule Created " + schedule.ID_SCHEDULE);
      res.status(201).send({status: true, id: schedule.ID_SCHEDULE});
    }
  } catch (error) {
    console.error(error);
    res.status(500).send("Error");
  }
};

const updateSchedule = async (req, res) => {
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
  } catch (error) {
    console.error(error);
    res.status(500).send(
        {message: error.message || 'Error updating'},
    );
  }
};
const deleteSchedule = async (req, res) => {
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
  } catch (error) {
    console.error(error);
    res.status(500).send(
        {message: error.message || 'Error deleting'},
    );
  }
};

module.exports = { getAllSchedules, getOneSchedule, createSchedule, updateSchedule, deleteSchedule };