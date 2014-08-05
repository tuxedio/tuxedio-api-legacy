FactoryGirl.define do
  factory :vendor_user, class: Vendor do
    sequence(:name) {|n| "Vendor_#{n}"}
    location "Boulder"
    zip_code "80301"
  end

  factory :boulder_vendor, class: User do
    sequence(:email) {|n| "boulder_vendor#{n}@vend.com"}
    password "foobar1234"
    password_confirmation "foobar1234"
    association :rolable, factory: :vendor_user, name: "Illegal Pete's"
  end

  factory :vendor, class: User do
    sequence(:email) {|n| "vendor.#{n}3@vend.com"}
    password "foobar1234"
    password_confirmation "foobar1234"
    association :rolable, factory: :vendor_user, name: "Larkburger"
  end

  factory :vendor1, class: User do
    sequence(:email) {|n| "vendor1.#{n}3@vend.com"}
    password "foobar1234"
    password_confirmation "foobar1234"
    association :rolable, factory: :vendor_user, name: "Larkburger"
  end

  factory :vendor2, class: User do
    sequence(:email) {|n| "vendor2.#{n}3@vend.com"}
    password "foobar1234"
    password_confirmation "foobar1234"
    association :rolable, factory: :vendor_user, name: "Illegal Pete's"
  end

  factory :vendor3, class: User do
    sequence(:email) {|n| "vendor3.#{n}3@vend.com"}
    password "foobar1234"
    password_confirmation "foobar1234"
    association :rolable, factory: :vendor_user, name: "Sushi Tora"
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
