# documentation for this gem: https://github.com/sferik/twitter
require 'twitter'


class TwitterMega
	# configuration for the gem
	@@client = Twitter::REST::Client.new do |config|
		config.consumer_key					=	"pjpFKcMYQpRKxHtlx7BOAl3VF"
		config.consumer_secret			=	"0P97amDne0PGgL1AUK0pM9caHoeS8pK8ZpLHQUJptm6V0VVmdP"
		config.access_token					=	"770927087934996480-o7yhhEBsBPi6FNDGdVKhIHBOkAgLmlb"
		config.access_token_secret	= "FsE2XlnwOorLMQp67PPdqm2behxmLS0SR5PqmKlpNrHn1"
	end

	def initialize
		puts "ciao"
	end

	def tweet_fetch(user)
		@@client.user_timeline(user)
	end

	def mentionings(user)
		puts "asking twitter for mentionings of #{user}...it may take a while"
		mentionings = @@client.search("@#{user}", options = { count: 100 })
		clean_up_mentionings(mentionings)
	end

	def clean_up_mentionings(mentionings)
		cleaned_mentionings = []
		mentionings.each do |mentioning|
			break if cleaned_mentionings.length > 10
			cleaned_mentionings << mentioning if mentioning.text[0..6] != "RT @esa"
		end
		return cleaned_mentionings
	end
end

TwitterMega.new.mentionings("esa").each_with_index do |result, i|
	puts "#{i}"
	puts result.text
	 
end



# DEBUG things, not necessary for the app
# twit = TwitterMega.new
# puts twit.tweet_fetch("salomanuel").first.text

# client.user_timeline("esa").each do |tweet|
# 	puts tweet.text
# 	puts "\n\n"
# end