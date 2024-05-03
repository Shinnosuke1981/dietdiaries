FactoryBot.define do
  factory :diary do
    entry_date { Date.today }
    current_weight { 70 }
    weight_difference { 1.5 }
    plus_calories { 1000 }
    minus_calories { 800 }
    calorie_balance { 200 }
    current_BFP { 20 }
    association :user
  end
end