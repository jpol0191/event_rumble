class PastEventUsersController < ApplicationController

	def create
		@past_event_user = Past_event_user.new(past_event_user_params)
		if @past_event_user.save 
			# continue on to next page
		else 
			# handle errors here 
		end 
	end

	def update 
		@past_event_user = Past_event_user.find(params[:id])
		@past_event_user.update(past_event_user_params)
	end

	def destroy
		@past_event_user = Past_event_user.find(params[:id])
		@past_event_user.destroy
	end
	
	private 

	def past_event_user_params
		params.require(:past_event_user).permit(:past_event_id, :friend_id, )
end
