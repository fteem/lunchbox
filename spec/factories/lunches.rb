# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lunch do
    name "Some lunch in a restaurant"
    description "Lorem ipsum dolor sit amet"
    starts_on Date.today + 1.day
    ends_on Date.today + 2.days
  end
end
