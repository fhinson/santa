$(document).ready(getLocation);

var options = {
  enableHighAccuracy: false,
  timeout: 5000,
  maximumAge: 0
};

function getLocation(){
  if(navigator.geolocation){
    navigator.geolocation.watchPosition(locSuccess, locErr, options);
  }
  else {
    $("#locerror").append("Geolocation is not supported.");
  }
}

function locSuccess(pos){
  $("#loctext").text(pos.coords.latitude + "," + pos.coords.longitude);
}
function locErr(err){
  $("#locerror").append();
}

$(".notify").click(function() {
  $.ajax({
    url: '/drivers/notify',
    data: {location: ($("#loctext").text()), phone: $('#donor_phone').val(), id: id},
    type:   'GET',
    success: function (html) {
    },
    error: function (response) {
    }
  });
  $(".central").fadeOut();
  $(".load").fadeIn();
  window.setTimeout(function(){
    $(".loadtext").text("Nearby Drivers Found! Contacting Drivers...");
    $(".loader").hide();
    $(".loader-faster").show();
    doSomething();
  }, 5000);
});

function doSomething(){
  setTimeout(function(){
    $(".load").fadeOut();
    $(".central").fadeIn();
    swal("Driver has accepted ride!");
  },15000);
}

$("#deliver").click(function() {
  $.ajax({
    url: '/volunteers/check_delivered',
    data: {id: id},
    type:   'PUT',
    success: function (html) {
    },
    error: function (response) {
    }
  });
});

$('#undeliver').click(function (){
  $.ajax({
    url: '/volunteers/check_undelivered',
    data: {id: id},
    type:   'PUT',
    success: function (html) {
    },
    error: function (response) {
    }
  });
});
