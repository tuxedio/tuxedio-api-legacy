FactoryGirl.define do

  factory :person_user, class: User do
    sequence(:email) {|n| "person#{n}@example.com"}
    password "foobar1234"
    password_confirmation "foobar1234"
    after(:build) do |user|
      user.confirm!
    end
  end

  factory :person, class: Person do
    sequence(:name)  {Faker::Name.name}
    location "Boulder"
    hometown Faker::Address.city
    gender "male"
    date_of_birth 26.years.ago.to_date
    after(:build) do |person|
      person.user = build(:person_user, rolable: person)
    end
    after(:build) do |person|
      person.user.save!
    end
  end

  factory :person1, class: User do
    sequence(:name)  {Faker::Name.name}
    location "Boulder"
    hometown Faker::Address.city
    gender "male"
    zip_code "80301"
    date_of_birth 26.years.ago.to_date
    top_choices ["Larkburger", "Sushi Tora", "Illegal Pete's"]
    after(:build) do |person|
      person.user = build(:person_user, rolable: person)
    end
    after(:build) do |person|
      person.user.save!
    end
  end
end
