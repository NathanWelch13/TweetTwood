require 'twitter'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

=begin
locations = [
    -7.93, 55.40, -0.53, 60.92,
    -5.65, 51.60, 2.33, 56.13,
    -5.52, 50.60, 1.67, 51.84,
    -6.64, 49.82, 1.54, 51.29,
    -8.28, 54.07, -5.27, 55.35
]
=end
 	
=begin
	def postcode_lookup
		@postcode = Pat.get("")
			
		end	
=end		

class TwitterSearch
	def self.setup
		@@client = Twitter::REST::Client.new do |config|
		  config.consumer_key    = 'LBjIxToRQai86jbOd8fYQjOCO'
		  config.consumer_secret = 'mJtnz2EuiAzGf8aLljrECajRmGZzxw1YSequMSQJJMrAFGykbF'
		end
	end

	def self.search(query)
		if query == nil 
			@@client.search(":)", :result_type => "recent", :geocode => query).take(10)  	
		else
			@@client.search(query, :result_type => "recent", :geocode => query).take(100)
		end
        
	end
end
