class StatesController < ApplicationController
  def new
    @trademark = Trademark.find_by(id: params[:format])
    @state = State.new(trademark_id: @trademark.id)
    @state.save
    session[:trademark] = @trademark
  end

  # def create
    # @state.saveでからのtrademark_idのみが入ったからのstateを作る
  # end

  def edit
    @trademark = Trademark.find_by(id: params[:id])
    @state = State.find_by(trademark_id: @trademark.id)
    session[:trademark] = @trademark
  end

  def update
    @state = State.find_by(trademark_id: session[:trademark]["id"])
    if @state.update(trademark_params)
      redirect_to trademark_path(session[:trademark]["id"]), notice: "OK"
    else
      render 'edit'
    end
  end

  private
  def trademark_params
    params.require(:state).permit(:status_investigation, :status_apply, :status_judge, :status_registration)
  end
end
