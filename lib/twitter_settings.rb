module TwitterConfig
	require 'twitter'
	# require 'yaml'
	require 'json'

	def explanations
		puts "Twitter API v1.1 requires you to authenticate via OAuth, so you'll need to register your application with Twitter. Once you've registered an application, make sure to set the correct access level, otherwise you may see the error:"
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
		# file = YAML::load_file('lib/keys.dat') || {}
		# self.consumer_key = "a"
		# File.open('lib/keys.dat', 'r+') do |file|
		# 	file.write(file.to_yaml)
		# end
		File.open("keys.dat", "w") do |f|
			f.write(consumer_key: 			 @consumer_key,
							consumer_secret: 		 @consumer_secret,
							access_token:				 @access_token,
							access_token_secret: @access_secret)
		end
	end




	# @@client = Twitter::REST::Client.new do |config|
	# 	config.consumer_key					=	"pjpFKcMYQpRKxHtlx7BOAl3VF"
	# 	config.consumer_secret			=	"0P97amDne0PGgL1AUK0pM9caHoeS8pK8ZpLHQUJptm6V0VVmdP"
	# 	config.access_token					=	"770927087934996480-o7yhhEBsBPi6FNDGdVKhIHBOkAgLmlb"
	# 	config.access_token_secret	= "FsE2XlnwOorLMQp67PPdqm2behxmLS0SR5PqmKlpNrHn1"
	# end

end

class Uoo
	include TwitterConfig
	def initialize
		if File.exists?('keys.dat')
			puts "loading settings"
		else
			explanations 
			settings = File.new('keys.dat', 'w')
		end
		get_config
		write_config
	end
end

Uoo.new