FactoryGirl.define do
  factory :person, class: Person do
    name     "Example Person"
    email    "person@example.com"
    location "Boulder"
    password "foobar1234"
    password_confirmation "foobar1234"
    top_choices ["Larkburger", "Sushi Tora", "Illegal Pete's"]
  end

  factory :person1, class: Person do
    name     "New Person"
    email    "person1@example.com"
    location "Boulder"
    password "foobar1234"
    password_confirmation "foobar1234"
    top_choices ["Larkburger", "Sushi Tora", "Illegal Pete's"]
  end
end
