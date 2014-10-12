var accept = function () {
  $.mobile.changePage('#dialog', 'pop', true, true); 
  $.ajax({
    url: 'drivers/accept',
    type: 'PUT',
    data: {id: id},
    success: function () {
      $('#job').replaceWith("Accepted");
    }
  });
}