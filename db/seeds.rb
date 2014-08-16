# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Property.destroy_all
Property.create!([
	{
		price: 875000.00,
		address1: "601 Country Club Dr",
		city: "Carmel Valley",
		state: "CA",
		zip: "93924",
		active: true,
		image_file_name: "601_country_club.jpg"
		},
	{
		price: 350000.00,
		address1: "3069 Sunset Ave",
		city: "Marina",
		state: "CA",
		zip: "93933",
		active: true,
		image_file_name: "3069_sunset.jpg"
	},
	{
		price: 1395000.00,
		address1: "25910 Canada Drive",
		city: "Carmel",
		state: "CA",
		zip: "93923",
		active: true,
		image_file_name: "25910_canada_dr.jpg"
	},
	{
		price: 850000.00,
		address1: "1430 Manor Drive",
		city: "Monterey",
		state: "CA",
		zip: "93940",
		active: true,
		image_file_name: "1430_manor.jpg"
	}
])

property = Property.find_by(address1: '601 Country Club Dr')
property.open_houses.create!(starts_at: "2014-09-15 12:00:00", ends_at: "2014-09-15 15:00:00")
property.open_houses.create!(starts_at: "2014-09-22 12:00:00", ends_at: "2014-09-22 15:00:00")

property = Property.find_by(address1: '3069 Sunset Ave')
property.open_houses.create!(starts_at: "2014-09-26 4:00:00", ends_at: "2014-09-26 8:00:00")

property = Property.find_by(address1: '25910 Canada Drive')
property.open_houses.create!(starts_at: "2014-10-6 11:00:00", ends_at: "2014-10-6 16:00:00")
