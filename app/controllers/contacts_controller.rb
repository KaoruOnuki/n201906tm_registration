class ContactsController < ApplicationController
  before_action :set_trademark, only:[:index, :new]
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    @contact.trademark_id = session[:trademark]["id"]
    @trademark = Trademark.find_by(id: session[:trademark]["id"])
    if @contact.name.empty?
      @contact.name = current_user.user_name
    end

    if @contact.email.empty?
      @contact.email = current_user.email
    end

    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to @contact, notice: '調査依頼ありがとうございます。担当者より早急にご連絡をさせて頂きます。'
    else
      render :new
    end
  end

  def show
    @contact = Contact.find(params[:id])
    @trademark = Trademark.find_by(id: @contact.trademark_id)
    redirect_to new_session_path if @contact.user_id != current_user.id
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :phone_number, :email, :company_name, :website, :content, :preferred_contact, :contact_time, :experienced, :agreed_regulation, :used, :user_id, :trademark_id, :tmname)
  end

  def set_trademark
    @trademark = Trademark.find_by(id: params[:format])
    session[:trademark] = @trademark
  end

end
