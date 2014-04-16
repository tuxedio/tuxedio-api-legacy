# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

vend1 = Vendor.create!(name: "Larkburger", email: "Vendor1@example.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1", zip_code: 80301)
vend1.confirm!

vend2 = Vendor.create!(name: "Larkburger", email: "Vendor2@example.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1", zip_code: 80301)
vend2.confirm!

vend3 = Vendor.create!(name: "Larkburger", email: "Vendor3@example.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1", zip_code: 80301)
vend3.confirm!


cust1 = Customer.create!(name: "John", email: "customer1@example.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1")
cust1.confirm!

cust2 = Customer.create!(name: "Adam", email: "customer2@example.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1")
cust2.confirm!

cust3 = Customer.create!(name: "Eve", email: "customer3@example.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1")
cust3.confirm!
