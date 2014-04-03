namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
  end
end

def make_users
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@test.com"
    password  = "password"
    location = "Boulder"
    User.create!(name:     name,
                 email:    email,
                 location: location,
                 password: password,
                 password_confirmation: password,
                 vendor:   false,
                 customer: true,
                 blogger:  false)
  end
end
