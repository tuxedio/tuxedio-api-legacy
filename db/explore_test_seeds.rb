vend1 = Vendor.create!(
  name: "Larkburger123",
  email: "larkburger123@example.com",
  location: "Boulder",
  password: "mypassword1",
  password_confirmation: "mypassword1",
  zip_code: 80302
)

vend1.confirm!


experience_name = vend1.name + " Experience"
experience_description = Faker::Lorem.sentence(5)
experience_location = "Boulder"
experience_price = Faker::Number.number(2)
vend1.experiences.create!(
  name: experience_name,
  description: experience_description,
  location: experience_location,
  price: experience_price
)

experiences = Experience.all
experiences.each do |experience|
  3.times do
    experience_start = Time.new(2020, 1, 1, 2, 2, 2, "+02:00")
    experience_end   = Time.new(2020, 1, 1, 3, 3, 3, "+03:00")
    experience.experience_times.create!(start_time: experience_start, end_time: experience_end, experience: experience)
  end
end
