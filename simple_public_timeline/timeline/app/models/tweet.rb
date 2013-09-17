class Tweet < ActiveRecord::Base
  def self.fetch_create(limit = 100)
    count = 0
    TweetStream::Client.new.sample do |status|
      tweet = Tweet.find_or_create_by_uid(status.id)
      tweet.update_attributes(
        name: status.user.name,
        screen_name: status.user.screen_name,
        profile_image_url: status.user.profile_image_url,
        content: status.text,
        published_at: status.created_at,
        source: status.source,
        language: status.lang
      ) 
      count += 1
      break if count >= limit
    end
    self.order('created_at desc').limit(limit)
  end

  def language_in_words
    Tweet.lang_map[self.language]
  end

  def self.lang_map
    {
      'ar' => 'Arabic', 
      'eu' => 'Basque',
      'ca' => 'Catalan', 
      'cs' => 'Czech', 
      'da' => 'Danish', 
      'nl' => 'Dutch', 
      'en' => 'US English', 
      'en-gb' => 'UK English', 
      'fa' => 'Farsi', 
      'fil' => 'Filipino', 
      'fi' => 'Finnish', 
      'fr' => 'French', 
      'gl' => 'Galician', 
      'de' => 'German', 
      'el' => 'Greek', 
      'he' => 'Hebrew', 
      'hi' => 'Hindi', 
      'hu' => 'Hungarian', 
      'id' => 'Indonesian', 
      'it' => 'Italian', 
      'ja' => 'Japanese', 
      'ko' => 'Korean', 
      'no' => 'Norwegian', 
      'pl' => 'Polish', 
      'pt' => 'Portuguese', 
      'ro' => 'Romainian', 
      'ru' => 'Russian', 
      'es' => 'Spanish', 
      'sv' => 'Swedish', 
      'th' => 'Thai', 
      'tr' => 'Turkish', 
      'uk' => 'Ukranian', 
      'ur' => 'Urdu', 
      'lolc' => 'Lolcatz', 
      'msa' => 'Malay', 
      'zh-cn' => 'Simplified Chinese', 
      'zh-tw' => 'Traditional Chinese'
    }
  end
end
