const express = require("express");
const router = express.Router();

const domains = require('../controllers/domainController');

router.get('/domains', domains.getAllDomains);
router.get('/domains/:id', domains.getOneDomain);
router.post('/domains', domains.createDomain);
router.put('/domains/:id', domains.updateDomain);
router.delete('/domains/:id', domains.deleteDomain);

module.exports = router;