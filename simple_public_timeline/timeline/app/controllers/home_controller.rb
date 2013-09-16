class HomeController < ApplicationController
  def index
    @tweets = Tweet.limit(20)
  end

  def more_tweets
    @more_tweets = Tweet.fetch_create(20)
    render partial: 'tweet', collection: @more_tweets
  end
end
