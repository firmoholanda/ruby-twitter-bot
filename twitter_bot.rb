require "Twitter"

while true

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

    # my topics to serach
    topics = ["#ruby", "#rails", "#coding"]
    
    s_client.filter(:track => topics.join(",")) do |tweet|
        if tweet.is_a?(Twitter::Tweet)
          puts tweet.text 
          #r_client.fav tweet
        end
    end
  rescue
    puts "error occurred, waiting for 15 seconds"
    sleep 15
  end

end