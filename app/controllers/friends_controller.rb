class FriendsController < ApplicationController
	def index
		@users = User.order("fname ASC").all
	end
	
	def create 
		@follow = Follower.new(user_id: current_user.id, boat_id: params[:boat_id])

    respond_to do |format|
      if @follow.save
        format.html { redirect_to :back, notice: 'follow was successfully created.' }
        format.json { render :show, status: :created, location: @follow }
      else
        format.html { render :new }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
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
