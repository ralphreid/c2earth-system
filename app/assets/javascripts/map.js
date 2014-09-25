(function() {

  window.onload = function() {

    function createMap() {
      // set map options
      var mapOptions = {
        center: new google.maps.LatLng(37.33858108520508, -121.88556671142578),
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };

      // create map
      var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

      // re-build map when resized
      google.maps.event.addDomListener(window, 'resize', redrawMap);
      createMarkerCenter(map);

      var myLatlng = new google.maps.LatLng(36.961740, -122.053906);
      createMarker(map, myLatlng);
      return map;
    }

    function createMarkerCenter(map) {
      var goldStar = {
        path: 'M 125,5 155,90 245,90 175,145 200,230 125,180 50,230 75,145 5,90 95,90 z',
        fillColor: 'yellow',
        fillOpacity: 0.8,
        scale: 0.3,
        strokeColor: 'gold',
        strokeWeight: 14
      };

      var marker = new google.maps.Marker({
        position: map.getCenter(),
        map: map,
        title: 'Click to zoom',
        icon: goldStar
      });
    }

    function createMarker(map, ltnlng) {
      console.log('createMarker function is working now mon');
      // console.log(ltnlng);
      new google.maps.Marker({
        position: ltnlng,
        map: map,
        title: 'Site is here I hope'
      });
    }
    

     // plotSites from /sites.json
    function plotSites(map) {
      $.getJSON('/sites.json', function(data) {
        $.each(data, function(idx, site) {
          // console.log(item);
          console.log(idx);
          console.log(site.longitude);
          console.log(site.latitude);

         createMarker(map, new google.maps.LatLng(site.latitude, site.longitude));
        });
      });
    }

    function redrawMap() {
      var map = createMap();
      plotSites(map);
    }

  var map = createMap();
  plotSites(map);

  };

}());
