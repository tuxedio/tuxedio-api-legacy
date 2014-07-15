FactoryGirl.define do
  factory :vendor, class: Vendor do
    name     "Example Vendor"
    email    "vendor@example.com"
    location "Boulder"
    zip_code "80301"
    password "foobar1234"
    password_confirmation "foobar1234"
  end

  factory :boulder_vendor, class: Vendor do
    name     "Illegal Pete's"
    email    "test3@vend.com"
    location "Boulder"
    zip_code "80301"
    password "foobar1234"
    password_confirmation "foobar1234"
  end

  factory :vendor1, class: Vendor do
    name     "Larkburger"
    email    "test1@vend.com"
    location "Boulder"
    zip_code "80301"
    password "foobar1234"
    password_confirmation "foobar1234"
  end

  factory :vendor2, class: Vendor do
    name     "Illegal Pete's"
    email    "test3@vend.com"
    location "Boulder"
    zip_code "80301"
    password "foobar1234"
    password_confirmation "foobar1234"
  end

  factory :vendor3, class: Vendor do
    name     "Sushi Tora"
    email    "test2@vend.com"
    location "Boulder"
    zip_code "80301"
    password "foobar1234"
    password_confirmation "foobar1234"
  end

  factory :yelp do
    name "Tangerine"
    location "Boulder"
    zip_code "80304"
    address "123 Elm St."
    phone_number "555-555-5555"
    country "US"
    coordinates :latitude => "100", :longitude => "100"
    state "CO"
    confirmed true
    sample_image "test"
  end
end
