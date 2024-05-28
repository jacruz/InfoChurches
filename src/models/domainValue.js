'use strict';
const {Model} = require('sequelize');

module.exports = (sequelize, DataTypes) => {
  
  class DomainValue extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      DomainValue.belongsTo(models.Domain, {
        foreignKey: "ID_DOMAIN",
      });
    }
  }
  DomainValue.init({
    ID_DOMAIN_VALUE: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },
    ID_DOMAIN: DataTypes.INTEGER,
    NAME: DataTypes.STRING,
    DESCRIPTION: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'DomainValue',
    tableName: 'DOMAIN_VALUES',
    timestamps: false //Disabling Auto-Timestamp Attributes 'createdAt' and 'updatedAt'.
  });

  return DomainValue;
};