FactoryGirl.define do
  factory :user do
    name     "John Smith"
    email    "jsmith@tuxedio.com"
    location "Boulder"
    password "foobar"
    password_confirmation "foobar"
    vendor false
    customer true
    blogger false

  end
end