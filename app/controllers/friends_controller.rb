class FriendsController < ApplicationController
	def index
		@users = User.order("fname ASC").all
	end
	
	 before_action :set_friend, only: [:destroy]
  
	def create
    @friend = Friend.new(user_id: current_user.id, friend_id: params[:myfriend_id])

    respond_to do |format|
      if @friend.save
        format.html { redirect_to :back, notice: 'Adding was successfull' }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :friends }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end 

  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Unfriended' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.where( friend_id: params[:id]).first
    end

end