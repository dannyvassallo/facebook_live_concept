class LandingController < ApplicationController
  require 'uri'

  def index
    @user = current_user
    @videos = @user.facebook.get_connections("me", "videos/uploaded")
    @feed = []
    @videos.each do |video|
      video_id = video["id"]
      username = @user.facebook.get_object("me")["id"]
      link = "https://www.facebook.com/#{username}/videos/#{video_id}"
      page_source = URI(link).read
      links = page_source.gsub("\\/", "/")
      parsed_links = URI.extract(links)
      parsed_links = parsed_links.split(',')[0]
      parsed_links.each do |link|
        if link.include?('.mp4')
          link = link.split('?')[0]
          @feed << link
        end
      end
    end
  end

end
