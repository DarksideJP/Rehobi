class Admin::EndUsersController < ApplicationController

before_action :authenticate_admin!

  def index
  	@end_users = EndUser.with_deleted
  end

  def show
  	@end_user = EndUser.with_deleted.find(params[:id])
  end

  def update
  	@end_user = EndUser.with_deleted.find(params[:id])
  	if @end_user.update(end_user_params)
  		if @end_user.is_unsubscribed == false
  			@end_user.restore
  		elsif @end_user.is_unsubscribed == true
  			@end_user.destroy
  		end
  		redirect_to request.referer, notice: "退会ステータスを変更しました"
  	end
  end

  private
  def end_user_params
  	params.require(:end_user).permit(:is_unsubscribed)
  end
end
