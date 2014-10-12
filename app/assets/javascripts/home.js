$('#btn1').on('click', function() {
  $.ajax({
    url: '/tags/id_from_code',
    type: 'GET',
    data: {code: $('#donor_info').val()},
    success: function (data) {
      console.log(data);
      window.location.replace('http://localhost:3000/tags/' + data);
    }
  });
});