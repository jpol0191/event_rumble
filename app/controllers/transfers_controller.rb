require 'net/http'

class TransfersController < WebsocketRails::BaseController

	def update_room

	end

	#request events from eventful api and sends it browser 
	def eventful_response
		uri = URI("http://api.eventful.com/json/events/search?callback=?&app_key=Q3knLXnFqsCt8wpQ&location=New+York&categories=#{message[:categories]}&date=#{message[:date]}") 

		response = Net::HTTP.get(uri)
		rslt = JSON.parse(response)

		broadcast_message :api_response, rslt

		group = Group.find(message[:group_id].to_i)
		group.update(stage: "STAGE2")
	end

end