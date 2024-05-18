# frozen_string_literal: true

# for movie
class Movie < ApplicationRecord
  validates :name, uniqueness: true
  has_many :schedules
end
