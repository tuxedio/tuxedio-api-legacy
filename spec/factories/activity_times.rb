FactoryGirl.define do
  factory :activity_time, class: ActivityTime do
    activity
    start_time Time.now.tomorrow
    end_time   Time.now.tomorrow + (2 * 60 * 60)
  end
end
