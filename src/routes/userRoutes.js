const express = require("express");
const router = express.Router();

const users = require('../controllers/userController');

router.get('/users', users.getAllUsers);
router.get('/users/:id', users.getOneUser);
router.post('/users', users.createUser);
router.put('/users/:id', users.updateUser);
router.delete('/users/:id', users.deleteUser);

module.exports = router;