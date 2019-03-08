class AdminUsersController < ApplicationController
  # before_action :your_page, only:[:show]
  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)
    if @admin_user.save
      redirect_to admin_user_path(@admin_user.id), notice: "アカウント登録完了"
    else
      render 'new'
    end
  end

  def show
    @admin_user = AdminUser.find(params[:id])
  end

  private
  def admin_user_params
    params.require(:admin_user).permit(:admin_name, :admin_email, :password, :password_confirmation)
  end

  # def your_page
  #   unless logged_in?
  #     redirect_to new_session_path
  #   end
  # end
end
