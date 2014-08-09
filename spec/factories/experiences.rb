FactoryGirl.define do
  factory :experience, class: Experience do
    association :vendor, factory: :vendor_user
    name "Skydiving"
    price 150.00
    location "Boulder"
    description "Ipsum splitsum"
  end
end
