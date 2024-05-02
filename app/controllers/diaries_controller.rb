class DiariesController < ApplicationController
  def index
    @diaries = current_user.diaries
    @latest_diary = @diaries.last
  end

  def new
    @diary = Diary.new
  end


end