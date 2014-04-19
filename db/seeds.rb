# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ipsum = "8-bit umami selvage cornhole asymmetrical cred. Scenester kitsch wolf, hella hoodie Thundercats art party sriracha kale chips tofu. Sartorial aesthetic cray you probably haven't heard of them, gastropub pickled yr plaid art party Wes Anderson. Hashtag wayfarers kitsch lo-fi, leggings small batch drinking vinegar."
samuelipsum = "Normally, both your asses would be dead as fucking fried chicken, but you happen to pull this shit while I'm in a transitional period so I don't wanna kill you, I wanna help you. But I can't give you this case, it don't belong to me. Besides, I've already been through too much shit this morning over this case to hand it over to your dumb ass."

choices = ["Larkburger", "Tangerine", "Chataqua Park"]
vend1 = Vendor.create!(name: "Larkburger", email: "Vendor1@example.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1", zip_code: 80301)
vend1.confirm!

vend2 = Vendor.create!(name: "Tangerine", email: "tangerine@example.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1", zip_code: 80304)
vend2.confirm!

vend3 = Vendor.create!(name: "Chataqua Park", email: "Vendor3@example.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1", zip_code: 80301)
vend3.confirm!

vender = Vendor.create!(name: "Example Vendor", email: "vendor@vendor.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1", zip_code: 80027)
vender.confirm!


cust1 = Customer.create!(name: "John", email: "customer1@example.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1", bio: ipsum)
cust1.confirm!
cust1.update!(top_choices: choices)

cust2 = Customer.create!(name: "Adam", email: "customer2@example.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1", bio: ipsum)
cust2.confirm!
cust2.update!(top_choices: choices)

cust3 = Customer.create!(name: "Eve", email: "customer3@example.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1", bio: ipsum)
cust3.confirm!
cust3.update!(top_choices: choices)

customer = Customer.create!(name: "Eve", email: "customer@customer.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1", bio: samuelipsum)
customer.confirm!
customer.update!(top_choices: choices)
