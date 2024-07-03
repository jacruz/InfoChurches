'use strict';
import {Model} from "sequelize";

module.exports = (sequelize:any, DataTypes:any) => {
  
  class Location extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models:any) {
      Location.belongsTo(models.Location, {
        foreignKey: "ID_LOCATION_PARENT",
      });
      Location.belongsTo(models.DomainValue, {
        foreignKey: "ID_DOM_LOCATION",
      });
    }
  }
  Location.init({
    ID_LOCATION: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },
    ID_DOM_LOCATION: DataTypes.INTEGER,
    ID_LOCATION_PARENT: DataTypes.INTEGER,
    NAME: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Location',
    tableName: 'LOCATIONS',
    timestamps: false //Disabling Auto-Timestamp Attributes 'createdAt' and 'updatedAt'.
  });
  return Location;
};