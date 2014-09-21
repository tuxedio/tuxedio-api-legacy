FactoryGirl.define do

  factory :vendor_user, class: V1::User do
    sequence(:email) {|n| "vendor#{n}@example.com"}
    password "foobar1234"
    password_confirmation "foobar1234"
    after(:build) do |user|
      user.confirm!
    end
  end

  factory :boulder_vendor, class: Vendor do
    name  "Illegal Pete's"
    location "Boulder"
    zip_code "80301"
    after(:build) do |vendor|
      vendor.user = create(:vendor_user, rolable: vendor)
    end
  end

  factory :vendor, class: Vendor do
    sequence(:name)  {Faker::Company.name}
    location "Boulder"
    zip_code "80301"
    after(:build) do |vendor|
      vendor.user = create(:vendor_user, rolable: vendor)
    end
  end

  factory :vendor1, class: Vendor do
    name  "Larkburger"
    location "Boulder"
    zip_code "80301"
    after(:build) do |vendor|
      vendor.user = create(:vendor_user, rolable: vendor)
    end
  end

  factory :vendor2, class: Vendor do
    name  "Illegal Pete's"
    location "Boulder"
    zip_code "80301"
    after(:build) do |vendor|
      vendor.user = create(:vendor_user, rolable: vendor)
    end
  end

  factory :vendor3, class: Vendor do
    name  "Sushi Tora"
    location "Boulder"
    zip_code "80301"
    after(:build) do |vendor|
      vendor.user = create(:vendor_user, rolable: vendor)
    end
  end

  factory :vendor_with_strange_name, class: Vendor do
    name  "hfgjfsfdtgdf"
    location "Boulder"
    zip_code "11111"
    after(:build) do |vendor|
      vendor.user = create(:vendor_user, rolable: vendor)
    end
  end

  factory :vendor_with_invalid_city, class: Vendor do
    name  "Starbucks"
    location "Boulder"
    zip_code "95403"
    after(:build) do |vendor|
      vendor.user = create(:vendor_user, rolable: vendor)
    end
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
