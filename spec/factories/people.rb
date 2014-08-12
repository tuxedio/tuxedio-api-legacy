FactoryGirl.define do
  factory :person_user, class: Person do
    sequence(:name)  {Faker::Name.name}
    location "Boulder"
    top_choices ["Larkburger", "Sushi Tora", "Illegal Pete's"]
  end

  factory :person, class: User do
    sequence(:email) {|n| "person#{n}@exmaple.com"}
    password "foobar1234"
    password_confirmation "foobar1234"
    association :rolable, factory: :person_user
  end

  factory :person1, class: User do
    sequence(:email) {|n| "personone#{n}@exmaple.com"}
    password "foobar1234"
    password_confirmation "foobar1234"
    association :rolable, factory: :person_user
  end
end
