class Tweet < ActiveRecord::Base
  def self.fetch_create
    binding.pry
    TweetStream::Client.new.sample do |status|
      tweet = Tweet.find_or_create_by_uid(status.id)
      tweet.update_attributes(
        name: status.user.name,
        screen_name: status.user.screen_name,
        profile_image_url: status.user.profile_image_url,
        content: status.text,
        published_at: status.created_at,
        source: status.source
      )
    end
  end
end
