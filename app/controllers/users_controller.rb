class UsersController < ApplicationController
  before_action :your_page, only:[:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id), notice: "アカウント登録完了"
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end

  def your_page
    unless logged_in?
      redirect_to new_session_path
    end
  end
end
