FactoryGirl.define do
  factory :journey_item, class: V1::JourneyItem do
    adventure
    experience_time
  end
end
