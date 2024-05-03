class DiariesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    if current_user
      @diaries = current_user.diaries
      @latest_diary = @diaries.last
    end
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def diary_params
    params.require(:diary).permit(
        :entry_date, 
        :current_weight, 
        :weight_difference, 
        :plus_calories, 
        :minus_calories, 
        :calorie_balance, 
        :current_BFP, 
        :diary_comment
    ).merge(user_id: current_user.id)
  end
end
