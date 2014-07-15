FactoryGirl.define do
  factory :experience, class: Experience do
    vendor
    name "Skydiving"
    price 150.00
    location "Boulder"
    description "Ipsum splitsum"
  end
end
