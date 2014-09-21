FactoryGirl.define do

  factory :person_user, class: V1::User do
    sequence(:email) {|n| "person#{n}@example.com"}
    password "foobar1234"
    password_confirmation "foobar1234"
    after(:build) do |user|
      user.confirm!
    end
  end

  factory :person, class: V1::Person do
    sequence(:name)  {Faker::Name.name}
    location "Boulder"
    hometown Faker::Address.city
    gender "male"
    date_of_birth 26.years.ago.to_date
    after(:build) do |person|
      person.user = create(:person_user, rolable: person)
    end
  end

  factory :person1, class: V1::User do
    sequence(:name)  {Faker::Name.name}
    location "Boulder"
    hometown Faker::Address.city
    gender "male"
    zip_code "80301"
    date_of_birth 26.years.ago.to_date
    top_choices ["Larkburger", "Sushi Tora", "Illegal Pete's"]
    after(:build) do |person|
      person.user = create(:person_user, rolable: person)
    end
  end
end
