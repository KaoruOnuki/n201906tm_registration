class AdminUsersController < ApplicationController
  before_action :your_admin_page, only:[:show]
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
    @all_trademarks = Trademark.all
  end

  private
  def admin_user_params
    params.require(:admin_user).permit(:admin_name, :admin_email, :password, :password_confirmation)
  end

  def your_admin_page
    unless logged_in? && session[:admin_user_id].present?
      redirect_to new_session_path
    end
  end
end
