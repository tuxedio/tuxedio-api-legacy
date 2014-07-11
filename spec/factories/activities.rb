FactoryGirl.define do
  factory :activity, class: Activity do
    vendor
    name "Skydiving"
    price 150.00
    location "Boulder"
    description "Ipsum splitsum"
  end
end
