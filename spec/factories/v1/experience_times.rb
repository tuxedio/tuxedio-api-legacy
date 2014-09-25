FactoryGirl.define do
  factory :experience_time, class: V1::ExperienceTime do
    experience
    start_time Time.now.tomorrow
    end_time   Time.now.tomorrow + (2 * 60 * 60)
  end
end
