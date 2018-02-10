require "twitter_mega"

describe TwitterMega do
	describe ".tweet_fetch" do
		it "gets the first tweet from my old account" do
			my_last_tweet = "Ascent successful. Dragon enroute to Space Station. Rocket landed on droneship, but too hard for survival."
			expect(TwitterMega.tweet_fetch("salomanuel").first).to eql(my_last_tweet)
		end
	end
end