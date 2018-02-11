# documentation for this gem: https://github.com/sferik/twitter
require 					'twitter'
require_relative 	'twitter_settings' # that's the other file
include 					TwitterSettings    # a module in twitter_settings.rb


class TwitterMega
	def initialize
		puts "Welcome to Twitter Mega Ninja Tweet (retriever)\n"
		puts "this wonderful application will give you infinite knowledge \n(in the form of the latest tweets mentioning a certain user)\n"


			# twitter_settings.rb is reading all the keys from the file
		config   = TwitterConfig.new.read_config
			# configuration for the gem
		@@client = Twitter::REST::Client.new(config)

			# all the user choices are made here, it's the interface
		menu	
			# main method, the workhorse
		mentionings 			= mentionings(@user)
			# sets how many results and removes retweets and own tweets
		clean_mentionings = clean_up_mentionings(mentionings, @results_size)
			# prints the results
		print_results(clean_mentionings)
	end

		# all the user choices are made here
	def menu				
			# choose target user
		puts "\nplease enter the user you are interested in (or press q to quit)"
		puts "(blank is @esa)"
		@user = gets.chomp
		case @user
		when "q" then exit
				# default user is @esa
		when ""  then @user = "esa"				
		end
			# choose number or results
		puts "select how many results you want"
		puts "(please keep it low or I will get banned from the free Twitter API)"
		@results_size = gets.chomp.to_i
		while @results_size > 50
			puts "\ncome on, choose a smaller number please"
			@results_size = gets.chomp.to_i
		end
	end
	
		# this method is not used, it was just to check the API
		# RSpec is still using it to make sure the app can talk to the API
	def tweet_fetch(user)
		@@client.user_timeline(user)
	end


		# MAIN SAIL method
	def mentionings(user)
		puts "asking twitter for mentionings of @#{user}...it may take a while"

		# this returns a potentially VERY long result list that also has the user's own tweets
		# please don't use EACH on it or it will return VERY long results
		@@client.search("@#{user}") # in a far future, the options hash may be necessary    #, options = { count: 100 })
	end

		# sets the results quantity and removes retweets and own tweets
	def clean_up_mentionings(mentionings, length)
		cleaned_mentionings = []
		mentionings.each do |mentioning|
			break if cleaned_mentionings.length > length # decides length
			next if mentioning.text[0..6] == "RT @esa"	 # removes retweets
			next if mentioning.text[0..3] == "@esa"			 # removes own tweets
			cleaned_mentionings << mentioning 
		end
		return cleaned_mentionings
	end

	def print_results(results)
		results.each_with_index do |result, i|
			puts "\n##{i}"
			puts result.text
		end
	end
end

TwitterMega.new




# DEBUG things, not necessary for the operation of the app

# TwitterMega.new.mentionings("esa").each_with_index do |result, i|
# 	puts "#{i}"
# 	puts result.text
	 
# end

# twit = TwitterMega.new
# puts twit.tweet_fetch("salomanuel").first.text

# client.user_timeline("esa").each do |tweet|
# 	puts tweet.text
# 	puts "\n\n"
# end