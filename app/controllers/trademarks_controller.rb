class TrademarksController < ApplicationController
  before_action :set_trademark, only:[:show, :destroy]
  before_action :your_page, only:[:index, :new, :show, :destroy]

  def index
    @trademarks = current_user.trademarks.all
  end

  def new
    @trademark = Trademark.new
  end

  def create
    @trademark = current_user.trademarks.new(trademark_params)
    if @trademark.save
      redirect_to trademarks_path, notice: "商標作成"
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    @trademark.destroy
    redirect_to trademarks_path, notice: "商標削除"
  end


  private
  def trademark_params
    params.require(:trademark).permit(:tm_name, :description)
  end

  def set_trademark
    @trademark = Trademark.find(params[:id])
  end

  def your_page
    unless logged_in?
      redirect_to new_session_path
    end
  end
end
