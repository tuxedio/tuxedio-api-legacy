vend1 = Vendor.create!(
  name: "Larkburger123",
  email: "larkburger123@example.com",
  location: "Boulder",
  password: "mypassword1",
  password_confirmation: "mypassword1",
  zip_code: 80302
)

vend1.confirm!


activity_name = vend1.name + " Activity"
activity_description = Faker::Lorem.sentence(5)
activity_location = Faker::Address.city
activity_price = Faker::Number.number(2)
vend1.activities.create!(
  name: activity_name,
  description: activity_description,
  location: activity_location,
  price: activity_price
)

activities = Activity.all
activities.each do |activity|
  3.times do
    activity_start = Time.new(2020, 1, 1, 2, 2, 2, "+02:00")
    activity_end   = Time.new(2020, 1, 1, 2, 2, 2, "+03:00")
    activity.activity_times.create!(start_time: activity_start, end_time: activity_end, activity_id: activity.id)
  end
end
