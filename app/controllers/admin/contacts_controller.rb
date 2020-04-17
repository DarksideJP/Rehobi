class Admin::ContactsController < ApplicationController
  def index
  	if params[:id] == "2"
  		@contacts = Contact.where.not(react_status: "complete" )
  	elsif params[:id] == "1"
  		@contacts = Contact.all
  	else
  		@contacts = Contact.all
  	end
  end

  def show
  	@contact = Contact.find(params[:id])
  end

  def update
  	contact = Contact.find(params[:id])
  	contact.update(contact_params)
  	if params[:contact][:react_status]
  		redirect_to request.referer, notice: "対応ステータスを変更しました"
  elsif params[:contact][:home_builder_id]
  		redirect_to request.referer, notice: "対応ホームビルダーを設定しました"
  	else
  		redirect_to request.referer, notice: "管理者用メモを更新しました"
  	end
  end

  private
  def contact_params
    params.require(:contact).permit(:end_user_id, :category_id, :home_builder_id, :housing_type, :title, :body, :preferred_contact, :admin_memo, :react_status)
  end
end
