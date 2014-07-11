FactoryGirl.define do
  factory :customer, class: Customer do
    name     "Example Customer"
    email    "customer@example.com"
    location "Boulder"
    password "foobar1234"
    password_confirmation "foobar1234"
    top_choices ["Larkburger", "Sushi Tora", "Illegal Pete's"]
  end

  factory :customer1, class: Customer do
    name     "New Customer"
    email    "customer1@example.com"
    location "Boulder"
    password "foobar1234"
    password_confirmation "foobar1234"
    top_choices ["Larkburger", "Sushi Tora", "Illegal Pete's"]
  end
end
