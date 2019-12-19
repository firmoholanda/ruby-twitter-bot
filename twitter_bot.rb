require "Twitter"

loop do

  puts "Press ctrl-c to stop"

  begin
    # connect to twitter api
    api_config = {
        consumer_key:        "niJqBHvcmyePEiiD1LHFI1HnO",
        consumer_secret:     "ug2mObU0N2NQ0RzSSlF5J0w0QOliFmdDjQA7FWYd4zKk2qWjit",
        access_token:        "25709895-Qy9pZeLoOXGHZT9D3C1LNKZcLDc0DbqQpkBjooLka",
        access_token_secret: "74AA4gcJDMbNfExZhBEE3XeCDlJhwnnKaga51wU9nTr2p"
    }
    r_client = Twitter::REST::Client.new api_config
    s_client = Twitter::Streaming::Client.new(api_config)

    # my topics to search
    #topics = ["microverseinc"]
    topics = ["ruby", "rails", "coding"]
    #topics = ["trump"]
    
    # puts found tweets
    s_client.filter(:track => topics.join(",")) do |tweet|
        if tweet.is_a?(Twitter::Tweet)
          
          #puts tweet.text
          
          #puts tweet.user.location.class

          if tweet.user.location.instance_of?(String)
            puts "-----------------------------------------------------------------------------------------"
            #puts "my twitter bot found that " + tweet.user.name + " is talking about ruby! from " + tweet.user.location
            puts tweet.user.name + " | " + tweet.user.location
          end

          #r_client.update("my twitter bot found that " + tweet.user.name + " is talking about ruby! from " tweet.user.location)
          #r_client.fav tweet
          #tweet.media.each{ |media| puts media.media_url.to_s }
        end
    end

  # stop program 15 seconds if cant get data 
  rescue
    puts "error occurred, waiting for 15 seconds..."
    sleep 15
  end

  # exit program gracefully
  rescue Interrupt
    puts "end"
    exit

end
