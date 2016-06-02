
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
	//array of ivited friends
	$('.autofill').hide();
	var array =[];
	//array for autofill
	var availableTags = []
	var i = 0;
	$('.container3').hide();

	$('.create-group').click(function(){
		$('.container').fadeOut(200);
		$('.group-list').fadeOut(200);
		$('.container3').fadeIn(600);
		$('.create-group').hide();
	});
	$("#tags input").on({
    focusout : function() {
      txtArry = []
      var txt = this.value.replace(/[^a-z0-9\+\-\.\#]/ig,''); // allowed characters
      if(txt) $("<span/>", {text:txt.toLowerCase(), insertBefore:this});
      txtArry.push(txt)
      this.value = "";
      array.push($('span').last().html());
      $('#group-creation-names').attr('value', $('#group-creation-names').attr('value') + "," + txtArry.join(',')) 
      // console.log(array);
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
    		// console.log(array)
    	}
    }
  });

  $(".autofill").each(function() {
  	availableTags.push($(this).html());
  });
  console.log(availableTags)
  $( "#tag" ).autocomplete({
      source: availableTags
    });

})

//= require websocket_rails/main

