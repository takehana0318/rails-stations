# frozen_string_literal: true

FactoryBot.define do
  factory :ranking do
    sequence(:movie_id) { 1 }
    sequence(:count) { 1 }
    sequence(:rank_name) { |n| Time.now + n.minutes }
  end
end
