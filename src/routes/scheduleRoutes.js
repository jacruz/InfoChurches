const express = require("express");
const router = express.Router();

const schedules = require('../controllers/scheduleController');

router.get('/schedules', schedules.getAllSchedules);
router.get('/schedules/:id', schedules.getOneSchedule);
router.post('/schedules', schedules.createSchedule);
router.put('/schedules/:id', schedules.updateSchedule);
router.delete('/schedules/:id', schedules.deleteSchedule);

module.exports = router;