var accept = function () {
  $.ajax({
    url: 'drivers/accept',
    type: 'PUT',
    data: {id: id},
    success: function () {
      $('#job').replaceWith("Accepted");
      parent.location='comgooglemaps://?daddr=' + loc;
    }
  });
}