class Diary < ApplicationRecord
  belongs_to :user

  validates :entry_date, presence: true
  validates :current_weight, presence: true, numericality: { greater_than: 0 }
  validates :weight_difference, numericality: true, allow_blank: true
  validates :plus_calories, numericality: true, allow_blank: true
  validates :minus_calories, numericality: true, allow_blank: true
  validates :calorie_balance, numericality: true, allow_blank: true
  validates :current_BFP, numericality: true, allow_blank: true
end
