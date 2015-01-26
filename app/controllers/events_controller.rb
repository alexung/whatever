class EventsController < ApplicationController
  include ApplicationHelper

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
      meetup_api(params["event"]["city"], params["event"]["country"])
      redirect_to root_path
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :zipcode)
  end

end
