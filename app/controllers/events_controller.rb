class EventsController < ApplicationController
  include ApplicationHelper

  def index
    @meetups = Event.all
  end

  def new
    @meetup = Event.new
  end

  def create
    @meetup = Event.new(event_params)
    @meetup.save
      meetup_api(ENV['MEETUP_API_KEY'], params[:zipcode])
      redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :zipcode)
  end

end
