$( function(){
  $('#add-player').on('click', function(e){
    e.preventDefault();
    $.post(app.postPath, {
      name: $('input#name').val(),
      email: $('input#email').val()
    })
  })
});