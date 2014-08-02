
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    samuelipsum = "Normally, both your asses would be dead as fucking fried chicken, but you happen to pull this shit while I'm in a transitional period so I don't wanna kill you, I wanna help you. But I can't give you this case, it don't belong to me. Besides, I've already been through too much shit this morning over this case to hand it over to your dumb ass."
    person = Person.new(name: "Eve", email: "person@person.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1", bio: samuelipsum)
    person.skip_confirmation!
    person.save
    person.adventures.create(name: "My Adventure", location: "Boulder", start_date: Time.now, number_of_days: 2)
    vendor = Vendor.new(name: "Tangerine", email: "vendor@vendor.com", location: "Boulder",
             password: "mypassword1", password_confirmation: "mypassword1", zip_code: 80304)
    vendor.skip_confirmation!
    vendor.save

    #-------------------------
    # Persons
    20.times do |n|
      name  = Faker::Name.name
      email = Faker::Internet.safe_email
      password  = "password"
      location = "Boulder"
      people = Person.new(name: name,
                       email: email,
                       location: location,
                       password: password,
                       password_confirmation: password)
      people.skip_confirmation!
      people.save!
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
    end

    #-------------------------
    # Experiences
    vendors = Vendor.last(10)
    vendors.each { |vendor|
      20.times do |n|
        experience_name = Faker::Address.city + " Experience"
        experience_description = Faker::Lorem.sentence(5)
        experience_location = "Boulder"
        experience_price = Faker::Number.number(2)
        vendor.experiences.create!(
          name: experience_name,
          description: experience_description,
          location: experience_location,
          price: experience_price,
          )
      end
    }

    #-------------------------
    # Experience Times
    experiences = Experience.all
    experiences.each do |experience|
      10.times do |n|
        random_month = rand(1..12)
        random_day = rand(1..28)
        experience_start = Time.new(2015, random_month, random_day, 2, 2, 2, "+02:00")
        experience_end = Time.new(2015, random_month, random_day, 3, 3, 3, "+03:00")
        experience.experience_times.create!(start_time: experience_start, end_time: experience_end, experience: experience)
      end
    end

  end
end
