FactoryGirl.define do
  factory :user, class: V1::User do
    sequence(:email) {|n| "user#{n}@example.com"}
    password "foobar1234"
    password_confirmation "foobar1234"

    after(:build) do |user|
      user.confirm!
    end
  end
end
