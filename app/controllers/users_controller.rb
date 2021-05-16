class UsersController < ApplicationController
  def show
    @user = current_user
    @event = Event.new
    @events = current_user.events.order(start: :asc)
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
