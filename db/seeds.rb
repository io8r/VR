# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all

Product.create!( title: 'Exploit 1',
	description: %{<p>'Useful item to hack you bro'</p>},
	image_url: 'exp1.png',
	price: 44.45 )

Product.create!( title: 'Exploit 2',
	description: %{<p>'Useful item to hack you bro'</p>},
	image_url: 'exp2.jpg',
	price: 123.34 )
