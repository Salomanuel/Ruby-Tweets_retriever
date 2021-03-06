module TwitterSettings
	class TwitterConfig
		require 'twitter'
		require 'json'

		def initialize
			if File.exists?('keys.dat')
				puts "settings file found, loading it"
			else
				create_config  # handles the creation of the config file, calling all the sub-methods
			end
		end

		def read_config
			JSON.parse(File.read("keys.dat"))
		end

		private
			
				# handles the creation of the config file, calling all the sub-methods
			def create_config
				explanations 
					# asks the user for the keys
				get_config
				write_config
			end


			def explanations
				puts "\n\n"
				puts "BUT FIRST \n"
				puts "Twitter API v1.1 requires you to authenticate via OAuth, so you'll need to register your application with Twitter. (https://apps.twitter.com/) \nOnce you've registered an application, make sure to set the correct access level, otherwise you may see the error:"
				puts "\nRead-only application cannot POST"
				puts 
				puts "Your new application will be assigned a consumer key/secret pair and you will be assigned an OAuth access token/secret pair for that application. You'll need to configure these values before you make a request or else you'll get the error:"
				puts "\nBad Authentication data"
			end

			def get_config
				@config = {}

				puts "\n\n"
				puts "you will need 4 codes: consumer key, consumer secret, access token and access secret"
				
				puts "please write your CONSUMER KEY"
				@config[:consumer_key] 		= gets.chomp
				puts "please write your CONSUMER SECRET"
				@config[:consumer_secret] = gets.chomp
				puts "please write your ACCESS TOKEN"
				@config[:access_token] 		= gets.chomp
				puts "please write your ACCESS SECRET"
				@config[:access_secret] 	= gets.chomp
			end

			def write_config
				File.open("keys.dat", "w") { |f|  f.write(@config.to_json) }
			end
		end
end

# DEBUG STUFF
	# include TwitterSettings
	# TwitterConfig.new