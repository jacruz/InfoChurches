'use strict';
import {Model} from "sequelize";

module.exports = (sequelize:any, DataTypes:any) => {
  
  class Link extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models:any) {
      Link.belongsTo(models.Church, {
        foreignKey: "ID_CHURCH",
      });
      Link.belongsTo(models.DomainValue, {
        foreignKey: "ID_DOM_LINK",
        as: "domain_link"
      });
    }
  }
  Link.init({
    ID_LINK: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },
    ID_CHURCH: DataTypes.INTEGER,
    ID_DOM_LINK: DataTypes.INTEGER,
    VALUE: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Link',
    tableName: 'LINKS',
    timestamps: false //Disabling Auto-Timestamp Attributes 'createdAt' and 'updatedAt'.
  });
  
  return Link;
};