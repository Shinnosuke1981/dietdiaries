class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :biological_sex_id, :birth_date, :age, :start_date, :height, :starting_weight, :appropriate_weight, :BMI, :starting_BFP, :term_goal, :comment, :email)
  end
end