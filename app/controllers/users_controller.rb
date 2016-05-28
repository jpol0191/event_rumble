class UsersController < ApplicationController
  def index
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
  # epic strong params, son! why only lname?
  private
  def user_params
  	params.require(:user).include(:email,:password,:phone,:fname,:lname)
  end
end
