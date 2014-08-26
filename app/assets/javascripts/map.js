(function() {
  window.onload = function() {

    // set map options
    var options = {
      center: new google.maps.LatLng(37.33858108520508, -121.88556671142578),
      zoom: 8
    };

    // create map
    var map = new google.maps.Map(document.getElementbyId('map-canvas'), options);

  };

}());
