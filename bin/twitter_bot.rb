require "Twitter"
require 'yaml'

class TwitterBot
  attr_accessor :topics_to_search, :display_wile_searching, :like_the_tweet, :alert_in_new_tweet
  attr_reader :stored_tweets, :total_stored_tweets

  def initialize(stored_tweets = Hash.new)
    @topics_to_search = topics_to_search
    @display_wile_searching = display_wile_searching
    @like_the_tweet = like_the_tweet
    @alert_in_new_tweet = alert_in_new_tweet
    @stored_tweets = stored_tweets
    @total_stored_tweets = total_stored_tweets
    connect_to_api
  end

  # private methos -------------------------------------------------------------------- #
  private

  def connect_to_api
    @@api_config = {
        consumer_key:        "niJqBHvcmyePEiiD1LHFI1HnO",
        consumer_secret:     "ug2mObU0N2NQ0RzSSlF5J0w0QOliFmdDjQA7FWYd4zKk2qWjit",
        access_token:        "25709895-Qy9pZeLoOXGHZT9D3C1LNKZcLDc0DbqQpkBjooLka",
        access_token_secret: "74AA4gcJDMbNfExZhBEE3XeCDlJhwnnKaga51wU9nTr2p"
    }
    @@r_client = Twitter::REST::Client.new @@api_config
    @@s_client = Twitter::Streaming::Client.new(@@api_config)
    puts "\nconnected to api..."
  end
    
  def hash_display(hash)
    puts "-----------------------------------------------------------------------------------------"
    hash.each do |key, value|
      puts key.to_s + ' | ' + value.to_s
    end
    puts "-----------------------------------------------------------------------------------------"
    puts "found: " + hash.length.to_s + " items!"
  end

  # public methos -------------------------------------------------------------------- #
  public

  def find_tweets(topics_to_search, display_wile_searching, like_the_tweet, alert_in_new_tweet)
    puts "gathering tweets..."
    puts "\npress ctrl-c to stop"
    
    @total_stored_tweets = 0
    @@s_client.filter(:track => topics_to_search.join(",")) do |tweet|
      if tweet.is_a?(Twitter::Tweet)
        if tweet.user.location.instance_of?(String)
          stored_tweets[tweet.user.name] = tweet.user.location
          
          if display_wile_searching # should display the search?
            puts "-----------------------------------------------------------------------------------------"
            puts tweet.user.name + " | " + tweet.user.location
          end

          if like_the_tweet # should like the tweet?
            @@r_client.fav tweet
          end

          if alert_in_new_tweet # shuld create a new tweet alerting?
            @@r_client.update("my twitter bot found that " + tweet.user.name + " is talking about " + topics_to_search.join(", ") + "! from " + tweet.user.location)
          end

          @total_stored_tweets +=1
        end
      end
    end
    
    rescue Interrupt # exit function gracefully
      puts "\nfound: " + @total_stored_tweets.to_s + " tweets!"
  end

  def save_stored_tweets
    File.open("stored_tweets.yml", "w") { |file| file.write(stored_tweets.to_yaml) }
  end

  def retrieve_stored_tweets
    @stored_tweets = YAML.load(File.read("stored_tweets.yml"))
    @total_stored_tweets = @stored_tweets.length 
  end

  def display_stored_tweets
    hash_display(stored_tweets)
  end

  def display_top_10_locations
    location_frequency = Hash.new(0)
    stored_tweets.values.each { |v| location_frequency.store(v, location_frequency[v]+1) }
    location_frequency = location_frequency.sort_by {|key, value| value}.to_h
    top_10_locations = location_frequency.max_by(10, &:last).to_h
    hash_display(top_10_locations)    
  end

end


my_bot = TwitterBot.new	

# my_bot.find_tweets(topics_to_search, display_wile_searching, like_the_tweet, alert_in_new_tweet)	
my_bot.find_tweets(["trump"], true, false, false)	
my_bot.display_top_10_locations	
my_bot.save_stored_tweets	


#my_bot.retrieve_stored_tweets	
#my_bot.display_stored_tweets