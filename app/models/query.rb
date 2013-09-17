class Query < ActiveRecord::Base
  # attr_accessible :title, :body



  # User will sign in
# User will search for local cuisine nearby
# Program will display restaurants that serve the local cuisine
# User will be able to choose the countries from which they have sampled food that are sorted by geographical location
# Once countries have been selected, the map will show the countries where a person has sampled cuisine from being highlighted
# User can enter the name of the dish they tried and how much they liked the cuisine

require 'yelpster'
require 'oauth'
def initialize
	consumer_key = 'EUcoj33x9x0XScuxAU0Y2w'
	consumer_secret = '-ZPlORm6Q5V_b5OmltDNk2mwGgc'
	token = 'Ao_8q4xsHf06mQ-SGdhePM0BHIii15uC'
	token_secret = 'WQGiHuuVgGoMd6h2Bi15EPYLhng'
	client = Yelp::Client.new
end

include Yelp::V2::Search::Request
def retrieve_results
	consumer_key = 'EUcoj33x9x0XScuxAU0Y2w'
	consumer_secret = '-ZPlORm6Q5V_b5OmltDNk2mwGgc'
	token = 'Ao_8q4xsHf06mQ-SGdhePM0BHIii15uC'
	token_secret = 'WQGiHuuVgGoMd6h2Bi15EPYLhng'
	client = Yelp::Client.new
	request = Location.new( 
		:city => 'San Francisco', 
		:state => 'CA', 
		:radius => 2, 
		:term => 'Spanish',
		:consumer_key => consumer_key,
		:consumer_secret => consumer_secret,
		:token => token, 
		:token_secret => token_secret,
		:limit => '7')
	response = client.search(request)

	puts "#{response.class}"

	response.each do |key, value|
		puts "Key:#{key} --- Value:#{value}"
	end

	restaurant_info_hash = response.values[2][0]
	puts "The restaurant info is a #{restaurant_info_hash.class}"

	#Below are the variables containing
	#Information about the restaurants retrieved 
	name = restaurant_info_hash["name"]
	phone = restaurant_info_hash["phone"]
	categories = restaurant_info_hash["categories"]
	categories_array = []
	categories.each do |x|
		categories_array.push(x[0])
		categories = categories_array.join(", ")
	end
		rating = restaurant_info_hash["rating"]
		url = restaurant_info_hash["mobile_url"]
		snippet_text = restaurant_info_hash["snippet_text"]
		address = restaurant_info_hash["location"]["display_address"]
		city = restaurant_info_hash["location"]["city"]
		state = restaurant_info_hash["location"]["state_code"]
		postal_code = restaurant_info_hash["location"]["postal_code"]
		country_code = restaurant_info_hash["location"]["country_code"]
		#show the user the information for each restaurant
		puts "Name: #{name}"
		puts "Phone: #{phone}"
		puts "Type of Cuisine: #{categories}"
		puts "Rating: #{rating}"
		puts "Yelp URL: #{url}"
		puts "Restaurant Info: #{snippet_text}"
		puts "Address:"
		#The address variable is a hash, so we will iterate through
		#each element (address, city, state, etc).
		 address.each do |x|
		 	# puts x
		 	puts name
		 end
	end

end
