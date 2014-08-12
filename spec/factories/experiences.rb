FactoryGirl.define do
  factory :experience, class: Experience do
    association :vendor, factory: :vendor_user
    sequence(:name)  {Faker::Company.name}
    sequence(:price) {Faker::Number.number(2)}
    location "Boulder"
    sequence(:description) {Faker::Lorem.sentence(5)}
  end
end
