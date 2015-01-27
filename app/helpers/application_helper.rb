require 'uri'

module ApplicationHelper

  def meetup_api(city)
    params = { category: '1',
      city: city.split(' ').join('%20'),
      status: 'upcoming',
      format: 'json'
    }

    meetup_api = MeetupApi.new
    @events = meetup_api.open_events(params)
    @events['results'].each_with_index do |event, i|
      @event = Event.new(title: @events['results'][i]['name'], description: @events['results'][i]['description'], group_title: @events['results'][i]['group']['name'], event_url: @events['results'][i]['event_url'])#, city: (@events['results'][i]['venue']['city'] || nil), country: (@events['results'][i]['venue']['country']))
      @event.save
    end
  end

end
