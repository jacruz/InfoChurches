function define(name, value) {
    Object.defineProperty(exports, name, {
        value:      value,
        enumerable: true
    });
}

define("DOM_VAL_COUNTRY", "country");
define("DOM_VAL_CITY", "city");
define("DOM_VAL_SECTOR", "sector");