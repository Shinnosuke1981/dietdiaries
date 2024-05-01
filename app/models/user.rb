class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :height, presence: true
  validates :email, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '半角英数字混合を使用してください' }
  validates_inclusion_of :biological_sex_id, in: 2..4, message: 'を選択してください'

  validate :password_include_at
  def password_include_at
    unless password.include?("@")
      errors.add(:password, 'must include @')
    end
  end
end
