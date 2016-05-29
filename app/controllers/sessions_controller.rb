class SessionsController < ApplicationController

	def create 
		user = User.find_by(email: session_params[:email]) 
  	if user && user.authenticate(session_params[:password])
  		session[:user_id] = user.id
  		redirect_to :back #Need to change later
  	else 
  		redirect_to :back
  	end
  end 

  def destroy
  	session.clear
  	redirect_to :back
  end

  private

  def session_params
  	params.require(:session).permit(:email, :password)
  end
end
