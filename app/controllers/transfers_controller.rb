class TransfersController < WebsocketRails::BaseController
	

	def ping
		broadcast_message :server_message, message
	end
end