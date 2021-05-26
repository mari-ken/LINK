class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @chat = Chat.new(room_id: @room.id)
    @chats = @room.chats
    @event = Event.new(room_id: @room.id)
    @events = @room.events
    invite_users = current_user.followings & current_user.followers # [1,2,3]
    @invite_users_ids = invite_users.pluck('id') # [1,2,3]
    @room_users_ids = @room.users.pluck('id') # [1,2]
    @invite_users = User.where(id: (@invite_users_ids - @room_users_ids))
  end

  def create
    @room = Room.new(room_params)
    @room.save
    current_user.user_rooms.create(room_id: @room.id)
    redirect_to room_path(@room.id)
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    redirect_to room_path(@room.id)
  end

  def destroy
  end

  private
  def room_params
    params.require(:room).permit(:name, :password, :image)
  end
end
