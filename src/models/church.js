'use strict';
const {Model} = require('sequelize');

module.exports = (sequelize, DataTypes) => {
  
  class Church extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      Church.hasMany(models.Link, {
        foreignKey: "ID_CHURCH",
        as: 'Link'
      });
      Church.hasMany(models.Schedule, {
        foreignKey: "ID_CHURCH",
        as: 'Schedule'
      });
      Church.belongsTo(models.Location, {
        foreignKey: "ID_LOCATION",
      });
    }
  }
  Church.init({
    ID_CHURCH: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },
    NAME: DataTypes.STRING,
    PRIEST_NAME: DataTypes.STRING,
    DIRECTION: DataTypes.STRING,
    ID_LOCATION: DataTypes.INTEGER,
    LATITUDE: DataTypes.INTEGER,
    LONGITUDE: DataTypes.INTEGER,
    MOBILE: DataTypes.STRING,
    LANDLINE: DataTypes.STRING,
    CREATED_AT: DataTypes.DATE,
    ID_USER_CREATED: DataTypes.INTEGER,
    UPDATED_AT: DataTypes.DATE,
    ID_USER_UPDATED: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'Church',
    tableName: 'CHURCHES',
    timestamps: false //Disabling Auto-Timestamp Attributes 'createdAt' and 'updatedAt'.
  });

  return Church;
};