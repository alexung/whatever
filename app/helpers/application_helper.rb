module ApplicationHelper

  def meetup_api(city, country)
    params = { category: '1',
      city: city,
      country: country,
      status: 'upcoming',
      format: 'json',
      page: '2'
    }

    meetup_api = MeetupApi.new
    @events = meetup_api.open_events(params)
    @events.each_with_index do |event, i|
      @event = Event.new(title: @events['results'][i]['name'], description: @events['results'][i]['description'].strip, group_title: @events['results'][i]['group']['name'])#, city: (@events['results'][i]['venue']['city'] || nil), country: (@events['results'][i]['venue']['country']))
      @event.save
    end
  end

end
