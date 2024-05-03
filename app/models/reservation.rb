class Reservation < ApplicationRecord
  validates :email, presence: true, length: { maximum: 300 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :schedule_id, uniqueness: {scope: :sheet_id}
  belongs_to :schedule
  belongs_to :sheet
end
