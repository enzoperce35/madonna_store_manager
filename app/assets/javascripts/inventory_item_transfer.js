// select2 is applied to the first default input box
$(document).ready(function() {
  $('.content-search').select2();
});

// select2 is applied to each rendered input box
$('#add-item').on('click', () => {
  setTimeout(function() {
    const last = Array.from( document.querySelectorAll('.content-search') ).pop()

     $(last).select2();
  }, 100);
});

// upon user item selection:
$('body').on('select2:select', '.content-search', function() {
  var input_id = 'quant-' + (this.id).toString()
  var unit_id  = 'unit-' + (this.id).toString()
  
  // perform ajax call on 'show' controller action to get the user input data
  $.ajax({
    url: "/transfers/" + (this.value).toString(),
    method: 'GET',
    dataType: 'json',
    success: function( data ){
      document.getElementById( input_id ).focus()
      document.getElementById( unit_id ).innerHTML = data[ 'unit' ]
    },
    error: function(data) {
      console.log( 'ajax callback error' )
    }
  });  
});
