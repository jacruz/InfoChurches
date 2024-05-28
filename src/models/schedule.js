'use strict';
const {Model} = require('sequelize');

module.exports = (sequelize, DataTypes) => {
  
  class Schedule extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      Schedule.belongsTo(models.Church, {
        foreignKey: "ID_CHURCH",
      });
      Schedule.belongsTo(models.DomainValue, {
        foreignKey: "ID_DOM_SCHEDULE",
        as: "domain_schedule"
      });
      Schedule.belongsTo(models.DomainValue, {
        foreignKey: "ID_DOM_DAY_OF_WEEK",
        as: "domain_day_of_week"
      });
    }
  }
  Schedule.init({
    ID_SCHEDULE: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },
    ID_CHURCH: DataTypes.INTEGER,
    ID_DOM_SCHEDULE: DataTypes.INTEGER,
    ID_DOM_DAY_OF_WEEK: DataTypes.INTEGER,
    START_TIME: DataTypes.STRING,
    END_TIME: DataTypes.STRING,
    COMMENTS: DataTypes.STRING,
  }, {
    sequelize,
    modelName: 'Schedule',
    tableName: 'SCHEDULES',
    timestamps: false //Disabling Auto-Timestamp Attributes 'createdAt' and 'updatedAt'.
  });
  
  return Schedule;
};