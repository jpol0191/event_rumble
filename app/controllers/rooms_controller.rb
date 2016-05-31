class RoomsController < ApplicationController
  def show
  	@user = User.find(params[:user_id])
  	@room = params[:id]
  end
end
