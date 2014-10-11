$(document).ready(getLocation);
function getLocation(){
	if(navigator.geolocation){
		navigator.geolocation.getCurrentPosition(showPos);
	}
	else { 
		$("#loctext").append("Geolocation is not supported.");
	}
}
function showPos(pos){
	$("#loctext").append(pos.coords.latitude + "<br>" + pos.coords.longitude);
}