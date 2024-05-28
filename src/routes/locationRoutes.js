const express = require("express");
const router = express.Router();

const location = require('../controllers/locationController');

router.get('/locations', location.getAllLocations);
router.get('/locations/:id', location.getOneLocation);
router.post('/locations', location.createLocation);
router.put('/locations/:id', location.updateLocation);
router.delete('/locations/:id', location.deleteLocation);

module.exports = router;