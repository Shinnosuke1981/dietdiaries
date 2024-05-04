class DiariesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :check_user, only: [:show, :edit, :update, :destroy]

  def index
    if current_user
      @diaries = current_user.diaries
      @latest_diary = @diaries.last
  
      start_date = params.fetch(:start_date, Date.today.beginning_of_month).to_date
      end_date = params.fetch(:end_date, Date.today.end_of_month).to_date
      @entries = current_user.diaries.where(entry_date: start_date..end_date)
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

  def show
    @diary = Diary.find(params[:id])
    if @diary.user_id != current_user.id
      redirect_to root_path, alert: '権限がありません'
    end
  end

  private

  def check_user
    @diary = current_user.diaries.find(params[:id])
    if @diary.nil?
      redirect_to root_path, alert: '不正なアクセスです。'
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
