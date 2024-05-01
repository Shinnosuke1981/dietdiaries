FactoryBot.define do
  factory :user do
    nickname              { 'test_user' }
    email                 { 'test@example.com' }
    password              { 'abc123' }
    password_confirmation { 'abc123' }
    height                { 180 }
    starting_weight       { 70 }
    appropriate_weight    { 65 }
    BMI                   { 24 }
    starting_BFP          { 20 }
    term_goal             { 3 }
    biological_sex_id     { 2 }
  end
end