require('dotenv').config(); // this is important!
module.exports = {
  "development": {
    "username": process.env.DATABASE_USER,
    "password": process.env.DATABASE_PASS,
    "database": process.env.DATABASE_NAME,
    "host": process.env.DATABASE_HOST,
    "dialect": "postgres",
    "dialectOptions": {
      ssl: true
    },
    logging: false
  },
  "test": {
    "username": "root",
    "password": null,
    "database": "database_test",
    "host": "127.0.0.1",
    "dialect": "postgres",
    logging: false
  },
  "production": {
    "username": process.env.DATABASE_USER,
    "password": process.env.DATABASE_PASS,
    "database": process.env.DATABASE_NAME,
    "host": process.env.DATABASE_HOST,
    "dialect": "postgres",
    "dialectOptions": {
      ssl: true
    },
    logging: false
  }
};
