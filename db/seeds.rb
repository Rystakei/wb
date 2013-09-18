# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# make list of countries
# Add country names and codes using http://asciicasts.com/episodes/179-seed-data

open("http://openconcept.ca/sites/openconcept.ca/files/country_code_drupal_0.txt") do |countries|  
  countries.read.each_line do |country|  
    code, name = country.chomp.split("|")  
    Country.create!(:name => name, :code => code, region:"unknown", status:0)  
  end  
end 

# Create an array for each region containing names of the countries

north_america = ["North America","Canada", "USA", "Mexico"]
asia = ["Asia", "Bangladesh", "Bhutan", "Brunei", "Cambodia", "China", "India", "Indonesia", "Japan", "Kazakhstan", "North", "Korea", "South", "Korea", "Kyrgyzstan", "Laos", "Malaysia", "Maldives", "Mongolia", "Myanmar", "Nepal", "Philippines", "Singapore", "Sri", "Lanka", "Taiwan", "Tajikistan", "Thailand", "Turkmenistan", "Uzbekistan", "Vietnam"]
middle_east_and_north_africa = ["Middle East/North Africa","Afghanistan", "Algeria", "Azerbaijan", "Bahrain", "Egypt", "Iran", "Iraq", "Israel**", "Jordan", "Kuwait", "Lebanon", "Libya", "Morocco", "Oman", "Pakistan", "Qatar", "Saudi Arabia", "Syria", "Tunisia", "Turkey", "United", "Arab", "Emirates", "Yemen"]
europe = ["Europe", "Albania", "Andorra", "Armenia", "Austria", "Belarus", "Belgium", "Bosnia and Herzegovina", "Bulgaria", "Croatia", "Cyprus", "Czech Republic", "Denmark", "Estonia", "Finland", "France", "Georgia", "Germany", "Greece", "Hungary", "Iceland*", "Ireland", "Italy", "Kosovo", "Latvia", "Liechtenstein", "Lithuania", "Luxembourg", "Macedonia", "Malta", "Moldova", "Monaco", "Montenegro", "Netherlands", "Norway", "Poland", "Portugal", "Romania", "Russia", "San Marino", "Serbia", "Slovakia", "Slovenia", "Spain", "Sweden", "Switzerland", "Ukraine", "United Kingdom", "Vatican City"]
central_america_and_caribbean = ["Central America/Caribbean", "Aruba","Antigua and Barbuda", "The Bahamas", "Barbados", "Belize", "Costa Rica", "Cuba", "Dominica", "Dominican Republic", "El Salvador", "Grenada", "Guatemala", "Haiti", "Honduras", "Jamaica", "Nicaragua", "Panama", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Trinidad and Tobago"]
south_america = ["South America", "Argentina", "Bolivia", "Brazil", "Chile", "Colombia", "Ecuador", "Guyana", "Paraguay", "Peru", "Suriname", "Uruguay", "Venezuela"]
sub_saharan_africa = ["Sub-Saharan Africa", "Angola", "Benin", "Botswana", "Burkina Faso", "Burundi", "Cameroon", "Cape Verde", "Central African Republic", "Chad", "Comoros", "Republic of the Congo", "Democratic Republic of the Congo", "Cote d'Ivoire", "Djibouti", "Equatorial Guinea", "Eritrea", "Ethiopia", "Gabon", "The Gambia", "Ghana", "Guinea", "Guinea-Bissau", "Kenya", "Lesotho", "Liberia", "Madagascar", "Malawi", "Mali", "Mauritania", "Mauritius", "Mozambique", "Namibia", "Niger", "Nigeria", "Rwanda", "Sao Tome and Principe", "Senegal", "Seychelles", "Sierra Leone","Somalia", "South Africa", "South Sudan", "Sudan", "Swaziland", "Tanzania", "Togo", "Uganda", "Zambia", "Zimbabwe"]
australia_and_oceania = ["Australia and Oceania","Australia", "East Timor", "Fiji", "Kiribati", "Marshall Islands", "Federated States of Micronesia", "Nauru", "New Zealand", "Palau", "Papua New Guinea", "Samoa", "Solomon Islands", "Tonga", "Tuvalu", "Vanuatu"]

regions = [north_america, central_america_and_caribbean, south_america, europe, middle_east_and_north_africa, sub_saharan_africa, asia, australia_and_oceania]

#Assign countries to a region
Country.all.each do |country|
    regions.each do |region|
        if region.include?(country.name)
            country.region = region[0]
            country.save
        end
    end
end



