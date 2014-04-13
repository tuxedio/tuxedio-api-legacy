# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Vendor.create(name: "Larkburger", email: "Vendor1@example.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1")

Vendor.create(name: "Sushi Tora", email: "Vendor2@example.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1")

Vendor.create(name: "Illegal Pete's", email: "Vendor3@example.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1")
