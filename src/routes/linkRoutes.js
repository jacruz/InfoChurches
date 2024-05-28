const express = require("express");
const router = express.Router();

const link = require('../controllers/linkController');

router.get('/links', link.getAllLinks);
router.get('/links/:id', link.getOneLink);
router.post('/links', link.createLink);
router.put('/links/:id', link.updateLink);
router.delete('/links/:id', link.deleteLink);

module.exports = router;