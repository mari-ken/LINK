class UsersController < ApplicationController
  def show
    @user = current_user
    @users = User.where.not(id: current_user.id)
    @event = Event.new
    @events = current_user.events.order(start: :asc)
    @followings = current_user.followings
    @followers = current_user.followers
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :image)
  end
end
