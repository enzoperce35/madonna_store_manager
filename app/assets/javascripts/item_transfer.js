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
$('body').on('select2:select', '.content-search', function(e) {
  var input_id   = 'quant-' + (this.id).toString()
  var unit_id    = 'unit-' + (this.id).toString()
  var item_class = this.dataset[ 'itemClass']
  
  // perform ajax call on transfer_controller to get the user input data
  $.ajax({
    url: "/transfers/selected_item_unit/" + (this.value).toString() + "?item_class=" + item_class,
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
