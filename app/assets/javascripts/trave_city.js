// This example displays an address form, using the autocomplete feature
// of the Google Places API to help users fill in the information.

// This example requires the Places library. Include the libraries=places
// parameter when you first load the API. For example:
// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">


var placeSearch, autocomplete_from, autocomplete_to;
var componentForm_from = {
    travel_city_from_lng: 'longitude',
    travel_city_from_lat: 'latitude',
    travel_city_from_address: 'address'
  // street_number: 'short_name',
  // route: 'long_name',
  // locality: 'long_name',
  // administrative_area_level_1: 'short_name',
  // country: 'long_name',
  // postal_code: 'short_name'
};

var componentForm_to = {
    travel_city_to_lng: 'longitude',
    travel_city_to_lat: 'latitude',
    travel_city_to_address: 'address'
};
function initAutocomplete() {
  if ($('#autocomplete_from').length > 0 )
  {
    // Create the autocomplete object, restricting the search to geographical
    // location types.
    autocomplete_from = new google.maps.places.Autocomplete(
        /** @type {!HTMLInputElement} */(document.getElementById('autocomplete_from')),
        {types: ['geocode']});

    // When the user selects an address from the dropdown, populate the address
    // fields in the form.
    autocomplete_from.addListener('place_changed', fillInAddress_from);

    autocomplete_to = new google.maps.places.Autocomplete(
        /** @type {!HTMLInputElement} */(document.getElementById('autocomplete_to')),
        {types: ['geocode']});

    // When the user selects an address from the dropdown, populate the address
    // fields in the form.
    autocomplete_to.addListener('place_changed', fillInAddress_to);
  }
}

function fillInAddress_from() {
  // Get the place details from the autocomplete object.
  var place = autocomplete_from.getPlace();

  document.getElementById('travel_city_from_lat').value = place.geometry.location.lat();
  document.getElementById('travel_city_from_lng').value = place.geometry.location.lng();
  // for (var component in componentForm_from) {
  //   document.getElementById(component).value = '';
  //   document.getElementById(component).disabled = false;
  // }

  // Get each component of the address from the place details
  // and fill the corresponding field on the form.
  // for (var i = 0; i < place.address_components.length; i++) {
  //   var addressType = place.address_components[i].types[0];
  //   if (componentForm_from[addressType]) {
  //     var val = place.address_components[i][componentForm_from[addressType]];
  //     document.getElementById(addressType).value = val;
  //   }
  // }
}


function fillInAddress_to() {
  // Get the place details from the autocomplete object.
  var place = autocomplete_to.getPlace();
  document.getElementById('travel_city_to_lat').value = place.geometry.location.lat();
  document.getElementById('travel_city_to_lng').value = place.geometry.location.lng();
}

// Bias the autocomplete object to the user's geographical location,
// as supplied by the browser's 'navigator.geolocation' object.
function geolocate_from() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var geolocation = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      var circle = new google.maps.Circle({
        center: geolocation,
        radius: position.coords.accuracy
      });
      autocomplete_from.setBounds(circle.getBounds());
    });
  }
}


// Bias the autocomplete object to the user's geographical location,
// as supplied by the browser's 'navigator.geolocation' object.
function geolocate_to() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var geolocation = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      var circle = new google.maps.Circle({
        center: geolocation,
        radius: position.coords.accuracy
      });
      autocomplete_to.setBounds(circle.getBounds());
    });
  }
}
