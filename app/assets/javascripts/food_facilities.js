//--------------------------------------------
// ResultList
//--------------------------------------------

var ResultList = function(foodFacilities) {
  this.foodFacilities = foodFacilities;

  this.toString = function() {
    var str = '<ul class="list-group">';
    for (var i = 0; i < this.foodFacilities.length; i++) {
      str += new ResultListItem(this.foodFacilities[i]).toString();
    }
    str += '</ul>';
    return str;
  };
};

//--------------------------------------------
// ResultListItem
//--------------------------------------------

var ResultListItem = function(foodFacility) {
  foodFacility['applicant'] = foodFacility['applicant'] || '-';
  foodFacility['locationdescription'] = foodFacility['locationdescription'] || '-';
  foodFacility['address'] = foodFacility['address'] || '-';
  foodFacility['dayshours'] = foodFacility['dayshours'] || '-';
  foodFacility['fooditems'] = foodFacility['fooditems'] || '-';
  this.foodFacility = foodFacility;

  this.toString = function() {
    var str = '<li class="list-group-item">' +
      '<div class="result-wrap">' +
        '<h3>' + this.foodFacility['applicant'] + '</h3>' +
        '<p>Location: ' + this.foodFacility['locationdescription'] + '</p>' +
        '<p>Address: ' + this.foodFacility['address'] + '</p>' +
        '<p>Hours: ' + this.foodFacility['dayshours'] + '</p>' +
        '<p>Foods: ' + this.foodFacility['fooditems'] + '</p>' +
      '</div>';
    str += '</li>';
    return str;
  };
};

//--------------------------------------------
// MapWindow
//--------------------------------------------


var MapWindow = function(foodFacility) {
  foodFacility['locationdescription'] = foodFacility['locationdescription'] || '-';
  foodFacility['address'] = foodFacility['address'] || '-';
  foodFacility['fooditems'] = foodFacility['fooditems'] || '-';
  foodFacility['facilitytype'] = foodFacility['facilitytype'] || '-';
  foodFacility['dayshours'] = foodFacility['dayshours'] || '-';
  this.foodFacility = foodFacility;

  this.toString = function() {
    return '<div id="content">'+
      '<div id="siteNotice"></div>'+
        '<h1 id="firstHeading" class="firstHeading">' + this.foodFacility['applicant'] + '</h1>'+
        '<div id="bodyContent">'+
          '<p>Location: ' + this.foodFacility['locationdescription'] + '</p>' +
          '<p>Address: ' + this.foodFacility['address'] + '</p>' +
          '<p>Foods: ' + this.foodFacility['fooditems'] + '</p>' +
          '<p>Type: ' + this.foodFacility['facilitytype'] + '</p>' +
          '<p>Hours: ' + this.foodFacility['dayshours'] + '</p>' +
      '</div>'+
    '</div>';
  };
};

//--------------------------------------------
// Map
//--------------------------------------------

var map;
var markers;
var infoWindows;
function initMap(data, position) {
  //need a center position here
  var ll = position || {lat: 37.78, lng: -122.4};

  map = new google.maps.Map(document.getElementById('map'), {
    center: ll,
    zoom: 10
  });

  //collection markers
  //each with a lat and long
  //title
  if (data) {
    markers = [];
    for (var i = 0; i < data.length; i++) {
      var foodFacility = data[i];

      var marker = new google.maps.Marker({
        position: {
          lat: parseFloat(foodFacility['location']['latitude']),
          lng: parseFloat(foodFacility['location']['longitude'])
        },
        map: map,
        title: foodFacility['applicant']
      });
      marker['index'] = i;

      //collection listeners
      google.maps.event.addListener(marker, 'click', function() {
          var infowindow = new google.maps.InfoWindow({
            content: new MapWindow(data[this.index]).toString()
          });

          infowindow.open(map, this);
      });

      markers.push(marker);
    }
  }
}