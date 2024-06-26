# frozen_string_literal: true

FactoryBot.define do
  factory :theater do
    sequence(:name) { |n| "theater#{n}" }
  end
end
