class EventsController < ApplicationController
  def index
    @past_events = Event.past.all
    @upcoming_events = Event.upcoming.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = helpers.current_user.created_events.build(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to user_path(@event.creator_id), notice: 'Event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:description, :location, :event_date)
  end
end
