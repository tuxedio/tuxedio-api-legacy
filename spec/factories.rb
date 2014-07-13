FactoryGirl.define do

  factory :person, class: Person do
    name     "Example Person"
    email    "person@example.com"
    location "Boulder"
    password "foobar1234"
    password_confirmation "foobar1234"
    top_choices ["Larkburger", "Sushi Tora", "Illegal Pete's"]
  end

  factory :person1, class: Person do
    name     "New Person"
    email    "person1@example.com"
    location "Boulder"
    password "foobar1234"
    password_confirmation "foobar1234"
    top_choices ["Larkburger", "Sushi Tora", "Illegal Pete's"]
  end

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

  factory :adventure, class: Adventure do
    person
    name "Adventure1"
    location "Boulder"
    start_date Date.today
    number_of_days 1
  end

  factory :experience, class: Experience do
    vendor
    name "Skydiving"
    price 150.00
    location "Boulder"
    description "Ipsum splitsum"
  end

  factory :experience_time, class: ExperienceTime do
    experience
    start_time Time.now.tomorrow
    end_time   Time.now.tomorrow + (2 * 60 * 60)
  end

  factory :itinerary_item, class: ItineraryItem do
    adventure
    experience_time
  end

end
