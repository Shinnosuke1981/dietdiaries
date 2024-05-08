class DiariesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :check_user, only: [:show, :edit, :update, :destroy]

  def index
    puts "PARAMS: ", params.inspect
    if current_user
      @diaries = current_user.diaries
      @latest_diary = @diaries.last

      # カレンダー
      start_date = params.fetch(:start_date, Date.today.beginning_of_month).to_date.beginning_of_week(:sunday)
      end_date = params.fetch(:end_date, Date.today.end_of_month).to_date.end_of_week(:saturday)
      @entries = current_user.diaries.where(entry_date: start_date..end_date)

      # 折れ線グラフ
      @data = [{name:"体重", data: current_user.diaries.order(:entry_date).pluck(:entry_date, :current_weight).to_h}]
      @data1 = current_user.diaries.order(:entry_date).pluck(:entry_date, :plus_calories).to_h
      @data2 = current_user.diaries.order(:entry_date).pluck(:entry_date, :minus_calories).to_h
      @chart_data =[{name:"摂取カロリー", data:@data1},{name:"消費カロリー",data:@data2}]
    end
  end

  def new
    @diary = Diary.new(entry_date: params[:entry_date])
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

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      redirect_to @diary, notice: '日記が正常に更新されました'
    else
      render :edit
    end
  end
  
  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to diaries_url, notice: '日記が正常に削除されました'
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
