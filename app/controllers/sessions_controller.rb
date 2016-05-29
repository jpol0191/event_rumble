class SessionsController < ApplicationController

	def create 
		user = User.find_by(username: session_params[:username]) 
  	if user && user.authenticate(session_params[:password])
  		session[:user_id] = user.id
  		redirect_to :back #Need to change later
  	else 
  		redirect_to :back
  	end
  end 

  def destroy
  	session.clear
  	redirect_to root_path
  end

  private

  def session_params
  	params.require(:session).permit(:email, :password)
  end
end
