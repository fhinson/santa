var accept = function () {
  $("#lnkDialog").click(); 
  $.ajax({
    url: 'drivers/accept',
    type: 'PUT',
    data: {id: id},
    success: function () {
      $('#job').replaceWith("Accepted");
    }
  });
}