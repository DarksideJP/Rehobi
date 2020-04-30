class Admin::ContactsController < ApplicationController

before_action :authenticate_admin!

  def index
  	if params[:id] == "in_progress"
  		@contacts = Contact.where.not(react_status: "complete" )
  	elsif params[:id] == "all"
  		@contacts = Contact.all
  	elsif params[:id]
      @end_user = EndUser.with_deleted.find(params[:id])
      @contacts = @end_user.contacts.all
    else
  		@contacts = Contact.all
  	end
  end

  def show
  	@contact = Contact.find(params[:id])
    # binding.pry
    @end_user = EndUser.with_deleted.find(@contact.end_user_id)
  end

  def update
  	contact = Contact.find(params[:id])
    end_user = EndUser.with_deleted.find(contact.end_user_id)
    if end_user.deleted_at != nil
      end_user.restore
  	 contact.update(contact_params)
     end_user.destroy
   else
      contact.update(contact_params)
    end
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
