class EventsController < ApplicationController
  def index
    @events = current_user.events
  end

  def create
    @event = current_user.events.new(event_params)
    @event.save
    @events = current_user.events.order(start: :asc)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_back fallback_location: user_path(current_user.id)
  end

  private
  def event_params
    params.require(:event).permit(:title, :start, :end, :room_id)
  end
end
