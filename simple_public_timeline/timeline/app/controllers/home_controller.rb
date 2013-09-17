class HomeController < ApplicationController
  def index
    language = params[:language]
    if language
      @tweets = Tweet.where(language: language).limit(20)
    elsif
      @tweets = Tweet.known.limit(20)
    end
  end

  def more_tweets
    @more_tweets = Tweet.fetch_create(20)
    render partial: 'tweet', collection: @more_tweets
  end
end
