class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    current_user.follow(params[:user_id])
    @users = User.where.not(id: current_user.id)
    @followings = current_user.followings
    @followers = current_user.followers
  end

  def destroy
    current_user.unfollow(params[:user_id])
    @users = User.where.not(id: current_user.id)
    @followings = current_user.followings
    @followers = current_user.followers
  end
end
