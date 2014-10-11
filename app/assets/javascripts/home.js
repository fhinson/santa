$(document).ready(getLocation);

function getLocation(){
	if(navigator.geolocation){
		navigator.geolocation.watchPosition(locSuccess, locErr, options);
	}
	else {
		$("#locerror").append("Geolocation is not supported.");
	}
}

function locSuccess(pos){
	$("#loctext").(pos.coords.latitude + "," + pos.coords.longitude);
}
function locErr(err){
  $("#locerror").append()
}

$(".notify").click(function() {
  $.ajax({
    url: '/drivers/notify',
    data: {'location': ($("#loctext").val())},
    type:   'GET',
    success: function (html) {
      console.log(":)");
    },
    error: function (response) {
    }
  });
});