class CreateDiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :diaries do |t|
      t.date :entry_date, null: false
      t.float :current_weight, null: false
      t.float :weight_difference
      t.float :plus_calories
      t.float :minus_calories
      t.float :calorie_balance
      t.float :current_BFP
      t.text :diary_comment
      t.references :user, null: false, foreign_key: true 
      t.timestamps
    end
  end
end