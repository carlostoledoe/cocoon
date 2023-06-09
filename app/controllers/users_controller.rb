class UsersController < ApplicationController
  def new
    @user = User.new
    @user.friends.build
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render action: :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    @friends = @user.friends
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, friends_attributes: [:id, :friend_name, :_destroy])
  end
end