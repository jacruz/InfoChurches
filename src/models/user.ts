'use strict';
import {Model} from "sequelize";

module.exports = (sequelize:any, DataTypes:any) => {
  
  class User extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models:any) {
      // define association here
    }
  }
  User.init({
    ID_USER: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },
    FIRST_NAME: DataTypes.STRING,
    LAST_NAME: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'User',
    tableName: 'USERS',
    timestamps: false //Disabling Auto-Timestamp Attributes 'createdAt' and 'updatedAt'.
  });
  return User;
};