class PastEventsController < ApplicationController

	def create
		@past_event = Past_event.find(past_event_params)
		if @past_event.save
			#continue to next page
		else
			# handle errors here
		end
	end

	def destroy 
		@past_event = Past_event.find(params[:id])
		@past_event.destroy 
	end

	def update 
		@past_event = Past_event.find(params[:id])
		@past_event.update(past_event_params)
	end

	private

	def past_event_params
		params.require(:past_event).permit(:user_id, :name, :url, :location, :image)
	end
end
