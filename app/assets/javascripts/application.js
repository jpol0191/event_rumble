// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function(){
		$('.autofill').hide();
		var array =[]
		var i = 0;
	$('.form').hide();
	$('.create-group').click(function(){
		$('.form').show();
		$('.create-group').hide();
	});


	// $('.add-friend').click(function(){
	// 	// find a way to update value on the hidden field!
	// 	var invited =  $('select').closest('select').find('option:selected').val();
	// 	array.push(invited)
	// 	$('#group_fname').val($('#group_fname').val()+','+invited);
	// 	$('.add-friend').hide();
	// 	$("#friends option[value='" + invited + "']").hide();
	// 	if(array[array.length - 1] === array[array.length - 2]){
	// 		array.pop();
	// 		$('select').hide();
	// 		$('.add-friend').hide();
	// 	}
	// 	$('.invited-friends').html(array.join(', '));
	// });

	// $('select').click(function(){
	// 	$('.add-friend').show();
	// });

	// $('.clear-friend').click(function(){
	// 	array =[];
	// 	$('.invited-friends').html('')
	// 		$('select').show();
	// 		$('.add-friend').show();
	// 		$("#friends option").show();
	// });

	
	$("#tags input").on({
    focusout : function() {
      var txt = this.value.replace(/[^a-z0-9\+\-\.\#]/ig,''); // allowed characters
      if(txt) $("<span/>", {text:txt.toLowerCase(), insertBefore:this});
      this.value = "";
      array.push($('span').last().html());
      console.log(array);
    },
    keyup : function(ev) {
      // if: comma|enter (delimit more keyCodes with | pipe)
      if(/(188|13)/.test(ev.which)) $(this).focusout(); 
    }
  });
  $('#tags').on('click', 'span', function() {
    if(confirm("Remove "+ $(this).text() +"?")) $(this).remove(); 
    for(var i=0; i<array.length; i++){
    	if($(this).text() == array[i]){
    		array.pop(i);
    		array.pop(i);
    		console.log(array)
    	}
    }
  });

})
