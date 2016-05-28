class UsersController < ApplicationController
  def index
  	@user=User.new
  	@users=User.all
  end

  def create

  end

  def destroy
  	@user=User.find(params[:id])
  	@user.destroy
  end

  def update
  	@user=User.find(params[:id])
  	@user.update(user_params)
  end
  
  private

  def user_params
  	params.require(:user).permit(:email,:password,:phone,:fname,:lname)
  end
end
