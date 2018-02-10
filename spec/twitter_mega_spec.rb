require "twitter_mega"

describe TwitterMega do
	describe ".tweet_fetch" do
		it "gets the first tweet from my old account" do
			my_last_tweet = "RT @elonmusk: Ascent successful. Dragon enroute to Space Station. Rocket landed on droneship, but too hard for survival."
			expect(TwitterMega.new.tweet_fetch("salomanuel").first.text).to eql(my_last_tweet)
		end
	end
end