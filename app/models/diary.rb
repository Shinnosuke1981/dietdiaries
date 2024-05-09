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

  validate :entry_date_cannot_be_in_the_future

  def entry_date_cannot_be_in_the_future
    if entry_date.present? && entry_date > Date.today
      errors.add(:entry_date, "未来の日付は入力できません")
    end
  end
end