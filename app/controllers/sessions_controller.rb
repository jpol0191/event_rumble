class SessionsController < ApplicationController
  def index
    @user=User.new
  end
	def create 
		user = User.find_by(email: session_params[:email]) 
  	if user && user.authenticate(session_params[:password])
  		session[:user_id] = user.id
  		redirect_to user_path(user.id) #Need to change later
  	else 
  		redirect_to :back
  	end   
  end
  def destroy
  	session.clear
  	redirect_to root_path
  end
  def facebook
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to user_path(user.id)
  end

  private

  def session_params
  	params.require(:session).permit(:email, :password)
  end


end
