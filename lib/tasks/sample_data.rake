
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    samuelipsum = "Normally, both your asses would be dead as fucking fried chicken, but you happen to pull this shit while I'm in a transitional period so I don't wanna kill you, I wanna help you. But I can't give you this case, it don't belong to me. Besides, I've already been through too much shit this morning over this case to hand it over to your dumb ass."
    customer = Customer.create!(name: "Eve", email: "customer@customer.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1", bio: samuelipsum)
    customer.confirm!

    vender = Vendor.create!(name: "Example Vendor", email: "vendor@vendor.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1", zip_code: 80027)
    vender.confirm!

    20.times do |n|
      name  = Faker::Name.name
      email = Faker::Internet.safe_email
      password  = "password"
      location = "Boulder"
      customer = Customer.create!(name: name,
                       email: email,
                       location: location,
                       password: password,
                       password_confirmation: password)
      customer.confirm!
    end


    40.times do |n|
      name  = Faker::Name.name
      email = Faker::Internet.safe_email
      password  = "password"
      location = "Boulder"
      zip_code = Faker::Address.zip
      vendor = Vendor.create!(name: name,
                       email: email,
                       location: location,
                       zip_code: zip_code,
                       password: password,
                       password_confirmation: password)
      vendor.confirm!
    end
    vendors = Vendor.all(limit: 10)
    vendors.each { |vendor|
      20.times do |n|
        activity_name = vendor.name + " Activity #" + n.to_s
        activity_description = Faker::Lorem.sentence(5)
        activity_location = Faker::Address.city
        activity_price = Faker::Number.number(2)
        vendor.activities.create!(name: activity_name, description: activity_description, location: activity_location, price: activity_price)
      end
    }

  end
end
