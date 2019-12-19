require "Twitter"
require 'yaml'

class TwitterBot
  attr_accessor :topics_to_search, :display_wile_searching, :like_the_tweet, :alert_in_new_tweet
  attr_reader :tweet_user, :tweet_location, :stored_tweets

  def initialize(topics_to_search, display_wile_searching, like_the_tweet, alert_in_new_tweet, tweet_user = Array.new, tweet_location = Array.new)
    @topics_to_search = topics_to_search
    @display_wile_searching = display_wile_searching
    @like_the_tweet = like_the_tweet
    @alert_in_new_tweet = alert_in_new_tweet
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
          tweet_location[stored_tweets] = tweet.user.location
          
          # should display the search?
          if display_wile_searching
            puts "-----------------------------------------------------------------------------------------"
            puts tweet.user.name + " | " + tweet.user.location
          end

          # should like the tweet?
          if like_the_tweet
            @@r_client.fav tweet
          end

          # shuld create a new tweet alerting?
          if alert_in_new_tweet
            @@r_client.update("my twitter bot found that " + tweet.user.name + " is talking about " + topics_to_search.join(", ") + "! from " + tweet.user.location)
          end

          stored_tweets +=1
        end
      end
    end

    # exit function gracefully
    rescue Interrupt
      puts "\nfound: " + stored_tweets.to_s + " tweets!"
      #puts tweet_user[stored_tweets-1]
      #puts tweet_location[stored_tweets-1]
  end

end

# init aplication --------------------------------------------------------------------- #

# TwitterBot.new (topics_to_search, display_wile_searching, like_the_tweet, alert_in_new_tweet, save_to_file)
my_bot = TwitterBot.new(["ruby", "rails", "coding"], true, false, true)

#puts my_bot.stored_tweets

