require 'rails_helper'

RSpec.describe Diary, type: :model do
  before do
    @diary = FactoryBot.build(:diary)
  end

  describe 'diary validation' do
    it 'is valid with valid attributes' do
      expect(@diary).to be_valid
    end

    it 'is not valid without an entry_date' do
      @diary.entry_date = nil
      expect(@diary).to_not be_valid
    end

    it 'is not valid without a current_weight' do
      @diary.current_weight = nil
      expect(@diary).to_not be_valid
    end

    it 'is not valid if current_weight is not a number' do
      @diary.current_weight = 'abc'
      expect(@diary).to_not be_valid
    end

    it 'is not valid if current_weight is less than or equal to 0' do
      @diary.current_weight = 0
      expect(@diary).to_not be_valid
    end

    # You can add similar tests for the other attributes too
  end
end