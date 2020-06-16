class Admin::ContactsController < ApplicationController

before_action :authenticate_admin!

  def index
  	if params[:id] == "in_progress"
      #完了以外全て取得(進行中案件)
      contacts_in_progress = Contact.where.not(react_status: "complete" )
      @contacts = contacts_in_progress.page(params[:page])
  	elsif params[:id] == "all"
  		@contacts = Contact.all.page(params[:id])
    elsif params[:id] == "backlog"
      #未対応を全て取得
      contacts_backlog = Contact.where(react_status: "backlog")
      @contacts = contacts_backlog.page(params[:page])
      #特定の会員に紐づくお問い合わせを全て取得
  	elsif params[:id]
      @end_user = EndUser.with_deleted.find(params[:id])
      @contacts = @end_user.contacts.all.page(params[:page])
    else
  		@contacts = Contact.all.page(params[:page])
  	end
  end

  def show
  	@contact = Contact.find(params[:id])
    @end_user = EndUser.with_deleted.find(@contact.end_user_id)
  end

  def update
  	contact = Contact.find(params[:id])
    end_user = EndUser.with_deleted.find(contact.end_user_id)
      contact.update!(contact_params)
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
