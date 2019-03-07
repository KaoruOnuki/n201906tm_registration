class TrademarksController < ApplicationController
  before_action :set_trademark, only:[:show, :destroy]
  def index
    @trademarks = Trademark.all
  end

  def new
    @trademark = Trademark.new
  end

  def create
    @trademark = Trademark.new(trademark_params)
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
end
