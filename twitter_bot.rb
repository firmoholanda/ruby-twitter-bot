require "Twitter"

class TwitterBot
  attr_accessor :topics_to_search

  def initialize(topics_to_search)
    @topics_to_search = topics_to_search
    connect_to_api
    puts_found_tweets
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
  end

  # puts found tweets
  def puts_found_tweets

    @@s_client.filter(:track => topics_to_search) do |tweet|
      if tweet.is_a?(Twitter::Tweet)
        if tweet.user.location.instance_of?(String)
          puts "-----------------------------------------------------------------------------------------"
          puts tweet.user.name + " | " + tweet.user.location
        end
      end
    end

    # stop program 15 seconds if cant get data 
    #rescue
    #  puts "error occurred, waiting for 5 seconds..."
    #  sleep 5

  end

end

my_bot = TwitterBot.new("ruby")


#loop do

  #puts "Press ctrl-c to stop"

  #begin

  # exit program gracefully
  #rescue Interrupt
  #  puts "end"
  #  exit

#end
