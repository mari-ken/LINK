class UsersController < ApplicationController

  #マイページ
  def show
    @user = current_user
    @users = User.where.not(id: current_user.id) #自分以外のユーザーを取得
    @event = Event.new
    @events = current_user.events.order(start: :asc) #開始日時が古い順にソート
    @followings = current_user.followings
    @followers = current_user.followers
    @room = Room.new
    @rooms = current_user.rooms

    user_invites = AddUserToGroup.all
    @invites = []

    user_invites.each do |invite|
      if invite.user_id == current_user.id
        @invites << invite
      end
    end
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
