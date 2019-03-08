class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:session][:admin_email] == nil
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to trademarks_path
      else
        flash.now[:danger] = "ログインに失敗しました"
        render "new"
      end
    elsif params[:session][:email] == nil
      admin_user = AdminUser.find_by(admin_email: params[:session][:admin_email].downcase)
      if admin_user && admin_user.authenticate(params[:session][:password])
        session[:admin_user_id] = admin_user.id
        redirect_to admin_user_path(admin_user.id)

      else
        flash.now[:danger] = "ログインに失敗しました"
        render "new"
      end
    end
  end

  def destroy
    if session[:admin_user_id] == nil
      session.delete(:user_id)
      flash[:notice] = "ユーザーログアウト完了"
    elsif session[:user_id] == nil
      session.delete(:admin_user_id)
      flash[:notice] = "管理者ログアウト完了"
    end
    redirect_to new_session_path
  end
end
