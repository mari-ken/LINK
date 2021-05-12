class RoomsController < ApplicationController
  def index
    @rooms = current_user.rooms
    @non_rooms = Room.where(id: UserRoom.where.not(user_id: current_user.id).pluck(:id))
  end

  def new
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
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
