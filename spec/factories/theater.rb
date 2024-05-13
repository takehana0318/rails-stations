FactoryBot.define do
  factory :theater do
    sequence(:name) { |n| "theater#{n}" }
  end
end
