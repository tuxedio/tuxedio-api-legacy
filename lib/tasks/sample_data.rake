
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    samuelipsum = "Normally, both your asses would be dead as fucking fried chicken, but you happen to pull this shit while I'm in a transitional period so I don't wanna kill you, I wanna help you. But I can't give you this case, it don't belong to me. Besides, I've already been through too much shit this morning over this case to hand it over to your dumb ass."
    customer = Customer.new(name: "Eve", email: "customer@customer.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1", bio: samuelipsum)
    customer.skip_confirmation!
    customer.save
    customer.confirm!
    customer.trips.create(trip_name: "My Trip", location: "Boulder", start_date: Time.now, number_of_days: 2)

    vendor = Vendor.new(name: "Tangerine", email: "vendor@vendor.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1", zip_code: 80304)
    vendor.skip_confirmation!
    vendor.save
    vendor.confirm!

    #-------------------------
    # Customers
    20.times do |n|
      name  = Faker::Name.name
      email = Faker::Internet.safe_email
      password  = "password"
      location = "Boulder"
      customers = Customer.new(name: name,
                       email: email,
                       location: location,
                       password: password,
                       password_confirmation: password)
      customers.skip_confirmation!
      customers.save!
      customers.confirm!
    end

    #-------------------------
    # Vendors
    40.times do |n|
      name  = Faker::Company.name
      email = Faker::Internet.safe_email
      password = "password"
      location = "Boulder"
      zip_code = Faker::Address.zip
      vendors = Vendor.new(name: name,
                       email: email,
                       location: location,
                       zip_code: zip_code,
                       password: password,
                       password_confirmation: password)
      vendors.skip_confirmation!
      vendors.save
      vendors.confirm!
    end

    #-------------------------
    # Activities
    vendors = Vendor.all(limit: 10)
    vendors.each { |vendor|
      20.times do |n|
        activity_name = Faker::Address.city + " Activity"
        activity_description = Faker::Lorem.sentence(5)
        activity_location = Faker::Address.city
        activity_price = Faker::Number.number(2)
        vendor.activities.create!(
          name: activity_name,
          description: activity_description,
          location: activity_location,
          price: activity_price,
          )
      end
    }

    #-------------------------
    # Activity Times
    activities = Activity.all
    activities.each do |activity|
      10.times do |n|
        random_month = rand(1..12)
        random_day = rand(1..28)
        activity_start = Time.new(2015, random_month, random_day, 2, 2, 2, "+02:00")
        activity_end = Time.new(2015, random_month, random_day, 3, 3, 3, "+03:00")
        activity.activity_times.create!(start_time: activity_start, end_time: activity_end, activity_id: activity.id)
      end
    end


  end
end
