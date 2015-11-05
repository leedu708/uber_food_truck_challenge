//--------------------------------------------
// FoodFacility
//--------------------------------------------

var FoodFacility = function(attributes) {
  var _setAttributes = function(attributes) {
    for (a in attributes) {
      this[a] = attributes[a];
    }
  };

  _setAttributes.call(this, attributes);
};

//--------------------------------------------
// MapWindow
//--------------------------------------------

var MapWindow = function() {
  this.firstHeading;
  this.bodyContent;
  this.attribution;

  this.toString = function() {
    return '<div id="content">'+
    '<div id="siteNotice">'+
    '</div>'+
    '<h1 id="firstHeading" class="firstHeading">Food Truck</h1>'+
    '<div id="bodyContent">'+
    '<p>Body Content: about the food truck</p>'+
    '<p>Attribution: some info</p>'+
    '</div>'+
    '</div>';
  };
};

//--------------------------------------------
// Map
//--------------------------------------------

var map;
function initMap() {
  //need a center position here
  var ll = {lat: -25.363, lng: 131.044};

  map = new google.maps.Map(document.getElementById('map'), {
    center: ll,
    zoom: 8
  });

  //collection markers
  //each with a lat and long
  //title
  var marker = new google.maps.Marker({
    position: ll,
    map: map,
    title: 'Hello World!'
  });

  //collection windows
  var infowindow = new google.maps.InfoWindow({
    content: new MapWindow().toString()
  });

  //collection listeners
  marker.addListener('click', function() {
    infowindow.open(map, marker);
  });

}