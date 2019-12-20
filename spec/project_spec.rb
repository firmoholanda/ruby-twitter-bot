require "./bin/twitter_bot.rb"

# TwitterBot -------------------------------------------------------------------------- #
RSpec.describe TwitterBot do
  let(:my_bot) { TwitterBot.new }

  # stored_tweets
  describe "#stored_tweets" do
    it "stored_tweets" do
      expect(my_bot.stored_tweets).to be_an_instance_of(Hash)
    end
  end

  # save_stored_tweets
  describe "#save_stored_tweets" do
    it "save_stored_tweets" do
      expect(my_bot.save_stored_tweets).to be_an_instance_of(Integer)
    end
  end

  # retrieve_stored_tweets
  describe "#retrieve_stored_tweets" do
    it "retrieve_stored_tweets" do
      expect(my_bot.retrieve_stored_tweets).to be_an_instance_of(Integer)
    end
  end

end
