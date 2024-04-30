class DiariesController < ApplicationController
  before_action :authenticate_user!

  def index
    @diaries = current_user.diaries 
  end
end