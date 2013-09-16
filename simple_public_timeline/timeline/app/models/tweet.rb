class Tweet < ActiveRecord::Base
  attr_accessible :name, :profile_image_url, :published_at, :screen_name, :source
end
