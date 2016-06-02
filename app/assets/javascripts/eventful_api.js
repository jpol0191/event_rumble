function eventful(category,location,date){

	$.ajax({   
		url: "http://api.eventful.com/json/events/search?callback=?",   
		data: {     
			app_key: "Q3knLXnFqsCt8wpQ",
			location: location, 
			categories: category,
			date: date
		},   
		dataType: "json",   
		success: function(response) 
		{  
			// events = response.events.event
			// for(var i =0; i < events.length; i++){
			// 	$('#event-results').append('<li>'+ events[i].title +'</li>')
			// }

			console.log(response)
		} 
	});
	
}