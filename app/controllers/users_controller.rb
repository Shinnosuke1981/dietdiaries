class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      bypass_sign_in(@user) 
      redirect_to root_path
    else
      render 'devise/registrations/edit', status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :biological_sex_id, :birth_date, :age, :start_date, :height, :starting_weight, :appropriate_weight, :BMI, :starting_BFP, :term_goal, :comment, :email, :password, :password_confirmation)
  end
end