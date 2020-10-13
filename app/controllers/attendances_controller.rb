class AttendancesController < ApplicationController
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.attendees << helpers.current_user
        format.html { redirect_to user_path(session[:user_id]), notice: 'successfully attended to the event' }
      else
        format.html { redirect_to events_path, notice: 'Event not available' }
      end
    end
  end
end
