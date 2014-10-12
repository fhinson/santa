var accept = function () {
  $("#dialog").popup('open');
  $.ajax({
    url: 'drivers/accept',
    type: 'PUT',
    data: {id: id},
    success: function () {
      $('#job').replaceWith("Accepted");
    }
  });
}