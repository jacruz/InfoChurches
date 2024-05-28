'use strict';
const {Model} = require('sequelize');

module.exports = (sequelize, DataTypes) => {
  
  class Domain extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  Domain.init({
    ID_DOMAIN: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },
    NAME: DataTypes.STRING,
    DESCRIPTION: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Domain',
    tableName: 'DOMAINS',
    timestamps: false //Disabling Auto-Timestamp Attributes 'createdAt' and 'updatedAt'.
  });
  
  return Domain;
};