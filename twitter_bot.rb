require "Twitter"
require 'yaml'

class TwitterBot
  attr_accessor :topics_to_search
  attr_reader :tweet_user, :tweet_location, :stored_tweets

  def initialize(topics_to_search, tweet_user = Array.new)
    @topics_to_search = topics_to_search
    @tweet_user = tweet_user
    @tweet_location = tweet_location
    @stored_tweets = stored_tweets
    connect_to_api
    find_tweets
  end

  # connect to twitter api
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

  # find tweets
  def find_tweets
    puts "gathering tweets..."
    puts "\npress ctrl-c to stop"
    
    stored_tweets = 0
    @@s_client.filter(:track => topics_to_search.join(",")) do |tweet|
      if tweet.is_a?(Twitter::Tweet)
        if tweet.user.location.instance_of?(String)
          tweet_user[stored_tweets] = tweet.user.name
          #tweet_location[stored_tweets] = tweet.user.location
          #puts "-----------------------------------------------------------------------------------------"
          #puts tweet.user.name + " | " + tweet.user.location
          stored_tweets +=1
        end
      end
    end

    # exit function gracefully
    rescue Interrupt
      puts "\nfound: " + stored_tweets.to_s + " tweets!"
      puts tweet_user[stored_tweets-1]
  end

end

# init aplication --------------------------------------------------------------------- #

my_bot = TwitterBot.new(["ruby", "rails", "coding"])

puts my_bot.stored_tweets

