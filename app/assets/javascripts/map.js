function initialize() {

  // map.data.loadGeoJson('https://storage.googleapis.com/maps-devrel/google.json');



}
// initialize();


// get the json
function getJson() {
  $.getJSON('/sites.json', handleMapJson );
}
// handle callback
// iterate through it
function handleMapJson( data) {
  console.log(data);
  // var map = createMap();
  // testing the map
  map = createMap();

  $.each(data, function(i, val) {
    console.log(val);
    createMarker(val, map);
  });
  //centerMapOnMarkers(map);
}
// create the map
function createMap() {
  var mapOptions = {
    center: new google.maps.LatLng(37.33858108520508, -121.88556671142578),
    zoom: 8
  };
  var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
  return map;
}

// create a marker object for each item
function createMarker(val, map) {
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(val.latitude, val.longitude),
    map: map,
    title: 'Hello World!'
  });
}

// refactor by using site instead of val
// recenter the map after after all the markers created use the centerMapOnMarkers function

getJson();
