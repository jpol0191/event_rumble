class FriendsController < ApplicationController

	def create 
		@friend=Friend.new(friend_params)

		if @friend.save
			# continue like normal
		else
			# error handling 
		end
	end

	def update
		@friend=Friend.find(params[:id])
		@friend.update(friend_params)
	end

	def destroy 
		@friend=Friend.find(params[:id])
		@friend.destroy
	end
	
	private

	def friend_params
		params.require(:friend).permit(:user_id, :friend_id)
	end	
end
