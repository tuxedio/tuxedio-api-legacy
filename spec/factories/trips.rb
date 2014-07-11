FactoryGirl.define do
  factory :trip, class: Trip do
    customer
    name "Trip1"
    location "Boulder"
    start_date Date.today
    number_of_days 1
  end
end
