const express = require("express");
const router = express.Router();

const churches = require('../controllers/churchController');

router.get('/churches-nearby/', churches.getChurchesNearby);
router.get('/churches/', churches.getAllChurches);
router.get('/churches/:id', churches.getOneChurch);
router.post('/churches', churches.createChurch);
router.put('/churches/:id', churches.updateChurch);
router.delete('/churches/:id', churches.deleteChurch);

module.exports = router;