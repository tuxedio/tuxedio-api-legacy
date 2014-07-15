FactoryGirl.define do
  factory :adventure, class: Adventure do
    person
    name "Adventure1"
    location "Boulder"
    start_date Date.today
    number_of_days 1
  end
end
