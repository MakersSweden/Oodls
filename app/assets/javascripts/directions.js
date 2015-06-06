$(function() {
  $("#currentLocationLink").on("click", function() {
    GMaps.geolocate({
      success: function(position) {
        GMaps.geocode({
          lat: position.coords.latitude,
          lng: position.coords.longitude,
          callback: function(results, status) {
            window.location.href = location.protocol + '//' + location.host + location.pathname +
              '?current_location=true' +
              '&latitude=' + position.coords.latitude +
              '&longitude=' + position.coords.longitude +
              '&address=' + results[0].formatted_address
          }
        });
      },
      error: function(error) {
        alert('Geolocation failed: '+error.message);
      },
      not_supported: function() {
        alert("Your browser does not support geolocation");
      }
    });
  });
});
