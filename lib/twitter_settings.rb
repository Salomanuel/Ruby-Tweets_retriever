module TwitterSettings
	class TwitterConfig
		require 'twitter'
		require 'json'

		def initialize
			if File.exists?('keys.dat')
				puts "loading settings"
			else
				explanations 
				settings = File.new('keys.dat', 'w')
				get_config
				write_config
			end

		end

		def explanations
			puts "Twitter API v1.1 requires you to authenticate via OAuth, so you'll need to register your application with Twitter. (https://apps.twitter.com/) \nOnce you've registered an application, make sure to set the correct access level, otherwise you may see the error:"
			puts "Read-only application cannot POST"
			puts 
			puts "Your new application will be assigned a consumer key/secret pair and you will be assigned an OAuth access token/secret pair for that application. You'll need to configure these values before you make a request or else you'll get the error:"
			puts "Bad Authentication data"
		end

		def get_config
			puts "\n\n"
			puts "you will need 4 codes: consumer key, consumer secret, access token and access secret"
			
			puts "please write your CONSUMER KEY"
			@consumer_key 		= gets.chomp
			puts "please write your CONSUMER SECRET"
			@consumer_secret 	= gets.chomp
			puts "please write your ACCESS TOKEN"
			@access_token 		= gets.chomp
			puts "please write your ACCESS SECRET"
			@access_secret 		= gets.chomp
		end

		def write_config
			File.open("keys.dat", "w") do |f|
				f.write(consumer_key: 			 @consumer_key,
								consumer_secret: 		 @consumer_secret,
								access_token:				 @access_token,
								access_token_secret: @access_secret)
			end
		end
	end
end


include TwitterSettings
TwitterConfig.new