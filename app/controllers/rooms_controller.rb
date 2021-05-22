class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @chat = Chat.new(room_id: @room.id)
    @chats = @room.chats
    @event = Event.new(room_id: @room.id)
    @events = @room.events
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
    params.require(:room).permit(:name, :image)
  end
end
