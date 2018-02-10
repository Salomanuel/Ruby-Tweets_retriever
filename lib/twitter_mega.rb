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
		puts "this wonderful application will give you infinite knowledge \n(in the form of the latest tweets mentioning a certain user)\n"
		
		# all the choices are made here
		menu

		
		print_results(mentionings(@user))
	end

	def menu
		puts "\nplease enter the user you are interested in (or press q to quit)"
		puts "(blank is @esa)"
		@user = gets.chomp
		case @user
		when "q" then exit
		when ""  then @user = "esa"				# default user is @esa
		end

		puts "select how many results you want"
		puts "please keep it low or I will get banned from the free Twitter API"
		@results_size = gets.chomp
		while @results_size.to_i > 50
			puts "\ncome on, choose a smaller number please"
			@results_size = gets.chomp
		end
	end
	
	# this method is not used, it was just to check the API
	# RSpec is still using it to make sure the app can talk to the API
	def tweet_fetch(user)
		@@client.user_timeline(user)
	end


	# main method
	def mentionings(user)
		puts "asking twitter for mentionings of @#{user}...it may take a while"

		# this returns a potentially VERY long result list that also has the user's own tweets
		# please don't use EACH on it or it will return VERY long results
		mentionings = @@client.search("@#{user}") # in a far future, the options hash may be necessary    #, options = { count: 100 })
		
		# this removes the retweets
		clean_up_mentionings(mentionings)
	end

	def clean_up_mentionings(mentionings)
		cleaned_mentionings = []
		mentionings.each do |mentioning|
			break if cleaned_mentionings.length > 10
			next if mentioning.text[0..6] == "RT @esa"	# removes retweets
			next if mentioning.text[0..3] == "@esa"			# removes own tweets
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

# TwitterMega.new.mentionings("esa").each_with_index do |result, i|
# 	puts "#{i}"
# 	puts result.text
	 
# end



# DEBUG things, not necessary for the app
# twit = TwitterMega.new
# puts twit.tweet_fetch("salomanuel").first.text

# client.user_timeline("esa").each do |tweet|
# 	puts tweet.text
# 	puts "\n\n"
# end