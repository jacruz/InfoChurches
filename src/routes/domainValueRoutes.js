const express = require("express");
const router = express.Router();

const domainValue = require('../controllers/domainValueController');

router.get('/domainvalues', domainValue.getAllDomainValues);
router.get('/domainvalues/:id', domainValue.getOneDomainValues);
router.post('/domainvalues', domainValue.createDomainValues);
router.put('/domainvalues/:id', domainValue.updateDomainValues);
router.delete('/domainvalues/:id', domainValue.deleteDomainValues);

module.exports = router;