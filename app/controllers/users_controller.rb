class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @event = Event.new
    @events = Event.all
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
