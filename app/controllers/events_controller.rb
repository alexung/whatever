class EventsController < ApplicationController
  include ApplicationHelper

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    meetup_api(params["event"]["city"])
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
