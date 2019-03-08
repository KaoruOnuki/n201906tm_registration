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

  def edit
    @trademark = Trademark.find(params[:id])
  end

  def update
    @trademark = Trademark.find(params[:id])
    if @trademark.update(trademark_params)
      redirect_to trademark_path(@trademark.id)
    else
      render "edit"
    end
  end

  def destroy
    @trademark.destroy
    redirect_to trademarks_path, notice: "商標削除"
  end


  private
  def trademark_params
    params.require(:trademark).permit(:tm_name, :description, :investigation_result, :investigation_date, :apply_number, :apply_date, :judge_status, :registration_number, :registration_date, :maintenance_period)
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
