var userLatitude, userLongitude;

var map;

if (!navigator.geolocation) {
    $("#user-geolocation").hide();
}

returnSearchBoxToBottom = function () {
    $(".search-box").delay(1000).addClass("align-search-box", 1000, "easeInOutCubic");
    $('.twitter').fadeOut(1000);
};

var hideSplashImages = function () {
    $("#splash").fadeOut();
};

$("#user-postcode").submit(function (event) {
    event.preventDefault();
    var userPostcode = $("#postcode").val();
    assembleMap(userPostcode);
});

$("#user-geolocation").on("click", function () {
    fetchLocation();
    returnSearchBoxToBottom();
});

$(window).on('resize', function () {
    if (map) {
        map.setCenter(userLatitude, userLongitude);
    }
});

var generateMap = function (latitude, longitude) {
    map = new GMaps({
        div: '#map',
        lat: latitude,
        lng: longitude,
        zoom: 13,
        disableDefaultUI: true
    });
};

var spinner = function () {
    $('.spinner').css("opacity", "1");
    $('body').css("background-color", "#E5E3DF");
    $('#splash').hide();
};

var spinnerFadeOut = function () {
    $('.spinner').css("opacity", "0");
};

var fetchLocation = function () {
    spinner();
    navigator.geolocation.getCurrentPosition(function (position) {
        setUserPosition(position.coords.latitude, position.coords.longitude);
        var browserCoordinates = position.coords.latitude + ", " + position.coords.longitude;
        assembleMap(browserCoordinates);
        spinnerFadeOut();
    });
};

var setUserPosition = function (latitude, longitude) {
    userLatitude = latitude;
    userLongitude = longitude;
};

var addUserMarker = function (latitude, longitude) {
    map.addMarker({
        lat: latitude,
        lng: longitude
    });
};

var markerImage = function (url, size_x, size_y, origin_x, origin_y, anchor_x, anchor_y) {
    return image = {
        url: url,
        size: new google.maps.Size(size_x, size_y),
        origin: new google.maps.Point(origin_x, origin_y),
        anchor: new google.maps.Point(anchor_x, anchor_y)
    };
};

var infoWindowDisplay = function (windowContent) {
    return infoWindow = {
        content: windowContent,
        closeclick: function (event) {
            $('.search-box').fadeIn(1000);
        }
    };
};

var addTescoMarkers = function (tesco_info) {
    $.getJSON('data/tescolonglat.json', function (json) {
        for (var i in json) {
            map.addMarker({
                category: 'partner',
                lat: json[i][0],
                lng: json[i][1],
                icon: markerImage('images/tesco-pin.svg', 30, 48, 0, 0, 15, 48),
                animation: google.maps.Animation.DROP,
                infoWindow: infoWindowDisplay($('#tesco-info-window').html()),
                click: function (event) {
                    this.infoWindow.open(this.map, this);
                    $('.search-box').fadeIn(1000);
                }
            });
        }
    });
};

var addChurchMarkers = function (lat, lng) {
    var url = "http://api.svenskakyrkan.se/platser/v3/place?nearby=" + lng + "," + lat + "&nearbyRadius=50000&is=church&apikey=6e0b08cf-e05b-4ffb-80bb-6c04f619117a";
    $.getJSON(url, function (json) {
        for (var index = 0; index < json["Results"].length; index++) {
            var i = json["Results"][index];
            var donor_data = [{
                organisation: i.Name,
                description: "Kontakt...",
                id: 1,
                lat: i.Geolocation.Coordinates[1],
                lon: i.Geolocation.Coordinates[0]
            }];
            var donor_info = fillPartnerInfoWindow(0, donor_data);
            map.addMarker({
                category: 'partner',
                lat: i.Geolocation.Coordinates[1],
                lng: i.Geolocation.Coordinates[0],
                icon: markerImage('images/church-pin.svg', 30, 48, 0, 0, 15, 48),
                animation: google.maps.Animation.DROP,
                infoWindow: infoWindowDisplay(donor_info),
                click: function (event) {
                    this.infoWindow.open(this.map, this);
                    $('.search-box').fadeIn(1000);
                }
            });
        }
    });
};

var getCharityData = function () {
    var charity_data = $('.charity_data_class').data('charities-for-map');
    assembleCharityMarkers(charity_data);
};

var getDonorData = function () {
    var donor_data = $('.donor_data_class').data('donors-for-map');
    assembleDonorMarkers(donor_data);
};

var processCharityRequirements = function (i, charity_data) {
    return $.map(charity_data[i].requirements, function (req) {
        return "<img id='window-icons' src='/images/icons/" + req.heading + ".svg'>";
    });
};

var addCharityMarkers = function (i, charity_data, charity_info) {
    map.addMarker({
        category: 'charity',
        lat: charity_data[i].lat,
        lng: charity_data[i].lon,
        icon: markerImage('images/oodls-pin.svg', 30, 48, 0, 0, 15, 48),
        animation: google.maps.Animation.DROP,
        infoWindow: infoWindowDisplay(charity_info),
        click: function (event) {
            this.infoWindow.open(this.map, this);
            $('.search-box').fadeOut(1000);
        }
    });
};

var addDonorMarkers = function (i, donor_data, donor_info) {
    map.addMarker({
        category: 'donor',
        lat: donor_data[i].lat,
        lng: donor_data[i].lon,
        icon: markerImage('images/oodls-pin-2.svg', 30, 48, 0, 0, 15, 48),
        animation: google.maps.Animation.DROP,
        infoWindow: infoWindowDisplay(donor_info),
        click: function (event) {
            this.infoWindow.open(this.map, this);
            $('.search-box').fadeOut(1000);
        }
    });
};

var assembleCharityMarkers = function (charity_data) {
    for (var i in charity_data) {
        var requirements = processCharityRequirements(i, charity_data).join('');
        var charity_info = fillInfoWindow(i, charity_data, requirements);
        addCharityMarkers(i, charity_data, charity_info);
    }
};

var assembleDonorMarkers = function (donor_data) {
    for (var i in donor_data) {
        var donor_info = fillDonorInfoWindow(i, donor_data);
        addDonorMarkers(i, donor_data, donor_info);
    }
};

var fillInfoWindow = function (i, charity_data, requirements) {
    var html = $('#charity-info-window').html();
    var data = {
        organisation: charity_data[i].organisation,
        food_requirements: requirements,
        weekday_hours: charity_data[i].weekday_hours,
        weekend_hours: charity_data[i].weekend_hours,
        id: charity_data[i].id,
        lat: charity_data[i].lat,
        lon: charity_data[i].lon
    };
    return Mustache.render(html, data);
};

var fillDonorInfoWindow = function (i, donor_data) {
    var html = $('#donor-info-window').html();
    var data = {
        organisation: donor_data[i].organisation,
        description: donor_data[i].description,
        id: donor_data[i].id,
        lat: donor_data[i].lat,
        lon: donor_data[i].lon
    };
    return Mustache.render(html, data);
};

var fillPartnerInfoWindow = function (i, donor_data) {
    var html = $('#partner-info-window').html();
    var data = {
        organisation: donor_data[i].organisation,
        description: donor_data[i].description,
        id: donor_data[i].id,
        lat: donor_data[i].lat,
        lon: donor_data[i].lon
    };
    return Mustache.render(html, data);
};

var styles = [
    {
        "featureType": "road",
        "elementType": "geometry.stroke",
        "stylers": [
            {"color": "#62a905"}
        ]
    }, {
        "featureType": "road",
        "elementType": "geometry.fill",
        "stylers": [
            {"color": "#F9F9F9"}
        ]
    }, {
        "featureType": "road.highway",
        "elementType": "geometry.stroke",
        "stylers": [
            {"weight": 0.5}
        ]
    }, {
        "featureType": "road.arterial",
        "elementType": "geometry.stroke",
        "stylers": [
            {"weight": 0.5}
        ]
    }, {
        "featureType": "road.local",
        "elementType": "geometry.stroke",
        "stylers": [
            {"weight": 0.2}
        ]
    }, {
        "featureType": "road",
        "elementType": "labels",
        "stylers": [
            {"weight": 0.1},
            {"color": "#362009"}
        ]
    }, {
        "featureType": "road",
        "elementType": "labels.icon",
        "stylers": [
            {"visibility": "off"}
        ]
    }, {
        "featureType": "landscape",
        "elementType": "geometry.fill",
        "stylers": [
            {"color": "#EEEEEE"}
        ]
    }, {
        "featureType": "transit.line",
        "elementType": "geometry",
        "stylers": [
            {"visibility": "off"}
        ]
    }, {
        "featureType": "poi",
        "elementType": "labels",
        "stylers": [
            {"visibility": "off"}
        ]
    }
];

var styleMap = function () {
    map.addStyle({
        styledMapName: "Styled Map",
        styles: styles,
        mapTypeId: "map_style"
    });
};

var applyMapStyle = function () {
    map.setStyle("map_style");
};

var postcodeError = function () {
    $("#postcode").notify("Please enter a valid address", "error", {position: "top"});
    $('input:text').click(function () {
        $(this).val('');
    });
};

var assembleMap = function (postcode) {
    GMaps.geocode({
        address: postcode,
        callback: function (results, status) {
            if (status === 'OK') {
                var latlng = results[0].geometry.location;
                setUserPosition(latlng.lat(), latlng.lng());
                hideSplashImages();
                returnSearchBoxToBottom();
                generateMap(latlng.lat(), latlng.lng());
                styleMap();
                applyMapStyle();
                addUserMarker(latlng.lat(), latlng.lng());
                addTescoMarkers();
                addChurchMarkers(latlng.lat(), latlng.lng());
                getCharityData();
                getDonorData();
            }
            else {
                postcodeError();
            }
        }
    });
};

var toggleMarkerVisibility;
toggleMarkerVisibility = function (type) {
    map.markers.filter(function (obj) {
        if (obj.category == type) {
            console.log(obj.visible);
            if (obj.visible == true)
                obj.setVisible(false);
            else
                obj.setVisible(true)
        }
        ;

    });
};
