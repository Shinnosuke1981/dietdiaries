class Diary < ApplicationRecord
  belongs_to :user

  def start_time
    self.entry_date
  end

  validates :entry_date, presence: true, uniqueness: { scope: :user_id, message: "一日に一つだけ日記を投稿できます" }
  validates :current_weight, presence: true, numericality: { greater_than: 0 }
  validates :weight_difference, numericality: true, allow_blank: true
  validates :plus_calories, numericality: true, allow_blank: true
  validates :minus_calories, numericality: true, allow_blank: true
  validates :calorie_balance, numericality: true, allow_blank: true
  validates :current_BFP, numericality: true, allow_blank: true
end
