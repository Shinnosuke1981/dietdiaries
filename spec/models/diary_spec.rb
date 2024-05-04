require 'rails_helper'

RSpec.describe Diary, type: :model do
  before do
    @diary = FactoryBot.build(:diary)
  end

  describe '日記投稿' do
    context '日記投稿ができるとき' do
      it '全ての値が正しければ投稿できる' do
        expect(@diary).to be_valid
      end
    end

    context '日記投稿ができないとき' do
      it '日付がないと投稿できない' do
        @diary.entry_date = nil
        expect(@diary).to_not be_valid
      end

      it '同じ日に複数回投稿できない' do
        user = FactoryBot.create(:user)
        first_diary = FactoryBot.create(:diary, user: user, entry_date: Date.today)
        duplicate_diary = FactoryBot.build(:diary, user: user, entry_date: Date.today)
        expect(duplicate_diary).to_not be_valid
      end

      it '体重がないと投稿できない' do
        @diary.current_weight = nil
        expect(@diary).to_not be_valid
      end

      it '体重が数字でないと投稿できない' do
        @diary.current_weight = 'abc'
        expect(@diary).to_not be_valid
      end

      it '体重が0以下だと投稿できない' do
        @diary.current_weight = 0
        expect(@diary).to_not be_valid
      end
    end
  end
end