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
    data: {'location': ($("#loctext").text())},
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
  }, 5000);
});