def generate_random_country

	countrieslist = []

	User.last.countries.each do |country|
		if country.status == 2
			countrieslist.push(country.name)
			puts country.name
		end
	end

	puts "There are #{countrieslist.length} untried cuisines."


		r = Random.new
		random_number = r.rand(0..countrieslist.length-1)
		random_country = countrieslist[random_number]
		return random_country
end

generate_random_country