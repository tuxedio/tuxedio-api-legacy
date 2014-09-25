FactoryGirl.define do
  factory :experience, class: V1::Experience do
    association :vendor, factory: :vendor
    sequence(:name)  {Faker::Company.name}
    sequence(:price) {Faker::Number.number(2)}
    location "Boulder"
    sequence(:description) {Faker::Lorem.sentence(5)}
  end
end
