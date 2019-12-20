require "./lib/twitter_bot.rb"

# TwitterBot -------------------------------------------------------------------------- #
RSpec.describe TwitterBot do
  let(:my_bot) { TwitterBot.new }

  #my_bot.find_tweets(["ruby", "rails", "code"], false, false, false)
  #my_bot.save_stored_tweets

  #find_tweets
  #save_stored_tweets
  #retrieve_stored_tweets
  #display_stored_tweets
  #display_top_10_locations


  # find_tweets
  describe "#find_tweets" do
    it "initialize empty board to 9 - items" do
      expect(my_bot.total_stored_tweets).to eql( Integer )
    end

  end

end
