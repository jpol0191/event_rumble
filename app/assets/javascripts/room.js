$(document).ready(function(){
	$('#event-search').on('click', function(){
		var c = $('#category_selected').val();
		var d = $('#date_selected').val();
		

		$.ajax({   
			url: "http://api.eventful.com/json/events/search?callback=?",   
			data: {     
				app_key: "Q3knLXnFqsCt8wpQ",
				location: "New York", 
				categories: c,
				date: d
			},   
			dataType: "json",   
			success: function(response) 
			{  
				console.log(response)
				events = response.events.event
				for(var i =0; i < events.length; i++){
					var elem = $('#event-results')
					elem.append('<li>'+'<h4>'+ events[i].title+ '</h4>' +'</li>');

					// Show image if valid url exist
					elem.children().last().append('<img src="'+ (events[i].image ? events[i].image.medium.url : "/assets/no-picture.png" )+'">');

					// Show description, if description is invald display "No description"
					elem.children().last().append('<p>'+ (events[i].description ? events[i].description: "No description" ) + '</p>')
				}
			} 
		});
	})
})