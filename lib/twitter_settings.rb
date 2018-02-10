require 'twitter'

module TwitterConfig

	# if File.exists?('lib/keys.dat')
	# 	puts "read from file"
	# else
	# 	puts "create file"
	# 	settings = File.new('lib/keys.dat', 'w')
	# end

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
		explanations
		get_config
	end
end

Uoo.new