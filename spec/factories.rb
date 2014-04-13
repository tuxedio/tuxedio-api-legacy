FactoryGirl.define do
  factory :customer do
    name     "John Smith"
    email    "jsmith@tuxedio.com"
    location "Boulder"
    password "foobar1234"
    password_confirmation "foobar1234"
  end
  factory :vendor do
    name     "New Vendor"
    email    "vendor@tuxedio.com"
    location "Boulder"
    password "foobar1234"
    password_confirmation "foobar1234"
  end
end
