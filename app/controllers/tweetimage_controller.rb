require 'open-uri'
require 'tweet_filter'

class TweetimageController < ApplicationController
  
  def index
    redirect_to "/tweetimage/#{params[:twitter_handle]}"
  end
  
  def show
    @handle = params[:twitter_handle]

    # fetch tweets
    twitter_api_url = "https://api.twitter.com/1/statuses/user_timeline.json?include_entities=true&include_rts=true&screen_name=#{@handle}&count=10"
    tweets = JSON.parse(open(twitter_api_url).read).map {|t| t['text'] }
    
    @tweets = {}
    tweets.each do |tweet|
      google_image_api_url = "https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=#{URI.escape(filter_tweet(tweet))}"
      images = JSON.parse(open(google_image_api_url).read)
      if images['responseData']['results'].size > 0
        @tweets[tweet] = images['responseData']['results'].first['tbUrl']
      end
    end
  end
  
  private
  include TweetFilter
end
