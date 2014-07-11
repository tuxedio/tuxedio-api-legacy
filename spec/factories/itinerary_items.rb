FactoryGirl.define do
  factory :itinerary_item, class: ItineraryItem do
    trip
    activity_time
  end
end
