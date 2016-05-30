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
		var array =[]
		var i = 0;
	$('.form').hide();
	$('.create-group').click(function(){
		$('.form').show();
		$('.create-group').hide();
	});
	$('.add-friend').click(function(){
		// find a way to update value on the hidden field!
		var invited =  $('select').closest('select').find('option:selected').val();
		array.push(invited)
		$("#friends option[value='" + invited + "']").remove();
		if(array[array.length - 1] === undefined){
			array.pop();
			$('select').hide();
			$('.add-friend').hide();
		}
		$('h3').html(array.join(', '))
		console.log(array)
		// set value to be the current selected value
    arrayGlobal = jQuery("option:selected");
	});

	$('.clear-friend').click(function(){
		array =[];
		$('h3').html('')
	})
})
