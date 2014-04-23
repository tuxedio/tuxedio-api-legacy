samuelipsum = "Normally, both your asses would be dead as fucking fried chicken, but you happen to pull this shit while I'm in a transitional period so I don't wanna kill you, I wanna help you. But I can't give you this case, it don't belong to me. Besides, I've already been through too much shit this morning over this case to hand it over to your dumb ass."

choices = ["Larkburger", "Tangerine", "Chataqua Park"]

vend1 = Vendor.create!(
  name: "Larkburger123", 
  email: "larkburger123@example.com", 
  location: "Boulder",
  password: "mypassword1", 
  password_confirmation: "mypassword1", 
  zip_code: 80302
)

vend1.confirm!

20.times do |n|
  activity_name = vend1.name + " Activity #" + n.to_s
  activity_description = Faker::Lorem.sentence(5)
  activity_location = Faker::Address.city
  activity_price = Faker::Number.number(2)
  vend1.activities.create!(
    name: activity_name, 
    description: activity_description, 
    location: activity_location, 
    price: activity_price
  )
end
