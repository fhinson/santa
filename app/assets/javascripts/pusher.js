$(document).ready(function () {
  var pusher = new Pusher('536126ac399072282dd5');
  var channel = pusher.subscribe('volunteer_channel');
  channel.bind('deliver', function(data) {
    swal(data.message);
  });
});