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
    url: '/drivers/notify_drivers',
    data: {'location': ($("#loctext").val())},
    type:   'POST',
    success: function (html) {
      console.log(":)");
    },
    error: function (response) {
    }
  });
});