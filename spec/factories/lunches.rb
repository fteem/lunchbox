# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lunch do
    name "Some lunch in a restaurant"
    description "Lorem ipsum dolor sit amet"
  end

  factory :started_lunch, parent: :lunch do
    starts_on Date.today - 1.day
    ends_on Date.today + 1.day
  end

  factory :pending_lunch, parent: :lunch do
    starts_on Date.today + 1.day
    ends_on Date.today + 2.days
  end

  factory :ended_lunch, parent: :lunch do
    starts_on Date.today - 2.days
    ends_on Date.today - 1.day
  end
end
