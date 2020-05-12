class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new user_params
    if @user.save
      redirect_to users_path #user_url(@user)
    else
      flash[:success] = "Register failed"
      render :new
    end
  end
  private
  def user_params
    params.require(:user).permit :name,:email , :password, :password_confirmation
  end
  def destroy
    log_out
    redirect_to root_url
  end
end
