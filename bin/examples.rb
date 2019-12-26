require_relative "./twitter_bot.rb"

# init aplication
my_bot = TwitterBot.new

# my_bot.find_tweets(topics_to_search, display_wile_searching, like_the_tweet, alert_in_new_tweet)	
my_bot.find_tweets(["ruby", "rayls", "coding"], true, true, true)	
my_bot.display_top_10_locations	
my_bot.save_stored_tweets	

# my_bot.retrieve_stored_tweets	
# my_bot.display_stored_tweets