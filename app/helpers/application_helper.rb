module ApplicationHelper

  def meetup_api(meetup_key, zipcode)
    `curl 'https://api.meetup.com/2/events?member_id=108788592&key=' + ENV['MEETUP_API_KEY']`
  end

end
