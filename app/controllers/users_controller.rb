class UsersController < ApplicationController
  def index
    @users=User.all
    @user=User.new
    if current_user
      redirect_to user_path(current_user.id)
    end
  end

  def create
    if current_user
      redirect_to user_path(current_user.id)
    end
    @user = User.new(user_params)
    @user.image = "http://u.o0bc.com/avatars/no-user-image.gif"
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path
      else
        redirect_to sessions_path
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
     @user = User.find(params[:id])
     @past_events = PastEvent.where(:user_id => @user)
     @friend =Friend.where(:user_id => current_user.id)
     @group=Group.new
     @groups = Group.where(user_id: params[:id])
     @invitedlist = params[:fname]
     @group_member = GroupMember.new
     @friends = Friend.where(:user_id => current_user.id, :friend_id => params[:id]).first
     @buddy = Friend.where(:user_id => params[:id])
  end

  def destroy
    @user=User.find(params[:id])
    @user.destroy
    session.clear
    redirect_to root_path
  end

  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:email,:password,:phone,:fname,:lname, :image,:password_confirmation)
  end
end
