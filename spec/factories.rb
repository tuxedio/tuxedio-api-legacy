FactoryGirl.define do
  #sequence :vendor_email do |n|
   # "vendor#{n}@test.com"
  #end

  factory :customer, class: Customer do

    name     "New Customer"
    email    "customer@example.com"
    location "Boulder"
    password "foobar1234"
    password_confirmation "foobar1234"
  end
  
  factory :vendor, class: Vendor do
    name     "MyVendor"
    email    "vendor@example.com"
    location "Boulder"
    password "foobar1234"
    password_confirmation "foobar1234"
  end
  factory :vendor1, class: Vendor do
    name     "Larkburger"
    email    "test1@vend.com"
    location "Boulder"
    password "foobar1234"
    password_confirmation "foobar1234"
  end

  factory :vendor3, class: Vendor do
    name     "Sushi Tora"
    email    "test2@vend.com"
    location "Boulder"
    password "foobar1234"
    password_confirmation "foobar1234"
  end

  factory :vendor2, class: Vendor do
    name     "Illegal Pete's"
    email    "test3@vend.com"
    location "Boulder"
    password "foobar1234"
    password_confirmation "foobar1234"
  end
end
