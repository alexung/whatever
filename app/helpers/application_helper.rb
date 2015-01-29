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
    #binding.pry
    @events['results'].each_with_index do |event, i|
      group_url_edited = @events['results'][i]['group']['urlname'].split(' ').join('-')
      group_url = "http://www.meetup.com/" + group_url_edited
      begin
        @event = Event.new(title: @events['results'][i]['name'], description: @events['results'][i]['description'], group_title: @events['results'][i]['group']['name'], event_url: @events['results'][i]['event_url'], group_url: group_url, latitude: @events['results'][i]['venue']['lat'], longitude: @events['results'][i]['venue']['lon'])
        @event.save
      rescue
        @event = Event.new(title: @events['results'][i]['name'], description: @events['results'][i]['description'], group_title: @events['results'][i]['group']['name'], event_url: @events['results'][i]['event_url'], group_url: group_url)
        @event.save
      end
    end
  end

  def fandango_api(zipcode)
    time = Time.now.to_i.to_s
    `curl http://api.fandango.com/v1/?op=theatersbypostalcodesearch&postalcode=` + zipcode.to_s + `&apikey=` + ENV['FANDANGO_KEY'].to_s + ENV['FANDANGO_SECRET'].to_s + Time.now.to_i.to_s
  end

end
