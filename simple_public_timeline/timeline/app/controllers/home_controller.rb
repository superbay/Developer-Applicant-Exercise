class HomeController < ApplicationController
  def index
    @lang = params[:language]
    if @lang
      @tweets = Tweet.where(language: @lang).limit(20)
    elsif
      @tweets = Tweet.known.limit(20)
    end
  end

  def more_tweets
    @more_tweets = Tweet.fetch_create(20)
    render partial: 'tweet', collection: @more_tweets
  end
end
