class EndUser::ContactsController < ApplicationController

before_action :authenticate_end_user!

  def new
    @contact = Contact.new
    @end_user = EndUser.find(current_end_user.id)
    if params[:title]
      @contact.title = params[:title]
      @contact.category_id = params[:category_id].to_i
      @contact.preferred_contact = params[:preferred_contact]
      @contact.body = params[:body]
    end
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save
    redirect_to thanks_path
  end

  def check
    if params[:contact][:title].empty? || params[:contact][:body].empty?
      redirect_to new_contact_path, notice: "※入力をして下さい"
    else
      @end_user = EndUser.find(current_end_user.id)
    end
  end

  def thanks
  end

  def index
    @end_user = EndUser.find(current_end_user.id)
  end

  def show
    @contact = Contact.find(params[:id])
    if @contact.end_user != current_end_user
      redirect_to root_path
    end
  end

  def update
    contact = Contact.find(params[:id])
    contact.react_status = :failure
    contact.update(contact_params)
    redirect_to contacts_path
  end

  private
  def contact_params
    params.permit(:end_user_id, :category_id, :home_builder_id, :housing_type, :title, :body, :preferred_contact, :admin_memo, :react_status)
  end
end

