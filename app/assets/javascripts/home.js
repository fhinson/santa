$(document).ready(getLocation);

function getLocation(){
	if(navigator.geolocation){
		navigator.geolocation.watchPosition(function(pos){
			$("#loctext").append(pos.coords.latitude + "<br>" + pos.coords.longitude);
		});
	}
	else {
		$("#loctext").append("Geolocation is not supported.");
	}
}

function showPos(pos){
	$("#loctext").append(pos.coords.latitude + "<br>" + pos.coords.longitude);
}

// $(".notify").click(function() {
//   $.ajax({
//     url: '/,
//     data: {'explanation': ($(".bug_explanation").val())},
//     type:   'GET',
//     success: function (html) {
//       $('#report_tactic').modal('hide');
//       location.reload();
//     },
//     error: function (response) {
//     }
//   });
// });