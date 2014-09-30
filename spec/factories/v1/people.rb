FactoryGirl.define do
  factory :person, class: V1::Person do
    sequence(:name)  { Faker::Name.name }
    location "Boulder"
    hometown Faker::Address.city
    gender "male"
    date_of_birth 26.years.ago.to_date
    bio Faker::Lorem.paragraph

    trait :with_adventures do
      after :build do |person|
        person.adventures << create_list(:adventure, 10)
      end
    end

    trait :with_account do
      after :build do |person|
        person.user = build :user, rolable: person
      end
    end

    trait :nested_user do
      user_attributes email: Faker::Internet.email, password: "foobar123"
    end

    factory :person_with_account, traits: [:with_account]
    factory :person_with_adventures, traits: [:with_adventures]
    factory :person_nested_user, traits: [:nested_user]
  end
end
