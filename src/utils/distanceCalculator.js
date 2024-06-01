const getDistanceFromLatLonInKm = (lat1,lon1,lat2,lon2) => {
    var R = 6378.137; // Radius of the earth in km
    var dLat = deg2rad(lat2-lat1);  // deg2rad below
    var dLon = deg2rad(lon2-lon1); 
    var a = 
        Math.sin(dLat/2) * Math.sin(dLat/2) +
        Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * 
        Math.sin(dLon/2) * Math.sin(dLon/2)
        ; 
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
    var d = R * c; // Distance in km
    return d;
}
function deg2rad(deg) {
    return deg * (Math.PI/180)
}

const getBoundingBox = (lat, lon, radius) => {
    const R = 6378.137; // Radio de la Tierra en km
    const lonMin = lon - (radius / R / Math.cos(lat * Math.PI / 180)) * (180 / Math.PI);
    const lonMax = lon + (radius / R / Math.cos(lat * Math.PI / 180)) * (180 / Math.PI);
    const latMax = lat + (radius / R) * (180 / Math.PI);
    const latMin = lat - (radius / R) * (180 / Math.PI);
    return {
        northwest: { lat: latMax, lon: lonMin },
        northeast: { lat: latMax, lon: lonMax },
        southwest: { lat: latMin, lon: lonMin },
        southeast: { lat: latMin, lon: lonMax }
    };
}
/*
// Example usage
let latIn = 4.643829;
let lonIn = -74.175382
const initialPoint = { lat: latIn, lon: lonIn };
const distance = 1; // Distance in kilometers
const boundingBox = getBoundingBox(initialPoint.lat, initialPoint.lon, distance);
console.log(boundingBox);


let res = getDistanceFromLatLonInKm(latIn,lonIn,boundingBox.northwest.lat,boundingBox.northwest.lon);
console.log(res);
res = getDistanceFromLatLonInKm(latIn,lonIn,boundingBox.northeast.lat,boundingBox.northeast.lon);
console.log(res);
res = getDistanceFromLatLonInKm(latIn,lonIn,boundingBox.southwest.lat,boundingBox.southwest.lon);
console.log(res);
res = getDistanceFromLatLonInKm(latIn,lonIn,boundingBox.southeast.lat,boundingBox.southeast.lon);
console.log(res);
*/
module.exports = {getDistanceFromLatLonInKm,getBoundingBox};