class UsersController < ApplicationController
  def index
  	@users=User.all
    @user=User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to root_path
      else
        redirect_to sessions_path
      end
  end
  def show
     @user = User.find(params[:id])
     @users = User.order("fname ASC").all
     @group=Group.new
     @groups = Group.where(user_id: params[:id])
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
