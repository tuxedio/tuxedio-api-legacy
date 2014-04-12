FactoryGirl.define do
  factory :customer do
    name     "John Smith"
    email    "jsmith@tuxedio.com"
    location "Boulder"
    password "foobar"
    password_confirmation "foobar"
    user_role "Customer"
  end
end
