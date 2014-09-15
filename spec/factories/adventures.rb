FactoryGirl.define do
  factory :adventure, class: Adventure do
    association :person, factory: :person
    sequence(:name) {|n| "Adventure_#{n}"}
    location "Boulder"
    start_date Date.today
    number_of_days 1
  end
end
