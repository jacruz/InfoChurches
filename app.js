const express = require('express');
const app = express();
require('dotenv').config();
const port = process.env.PORT || 3000;

app.use(express.json());

/*
app.use('/api/v1', require('./src/routes/domainRoutes'));
app.use('/api/v1', require('./src/routes/domainValueRoutes'));
app.use('/api/v1', require('./src/routes/locationRoutes'));
app.use('/api/v1', require('./src/routes/userRoutes'));
app.use('/api/v1', require('./src/routes/linkRoutes'));
app.use('/api/v1', require('./src/routes/scheduleRoutes'));*/
app.use('/api/v1', require('./src/routes/churchRoutes'));

app.listen(port, ()=>{
    console.log(`Server listen on: port ${port}`);
});