class EventsController < ApplicationController
  def index
    @events = current_user.events
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @event.save
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_back fallback_location: user_path(current_user.id)
  end

  private
  def event_params
    params.require(:event).permit(:title, :start, :end)
  end
end
