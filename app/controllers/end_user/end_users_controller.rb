class EndUser::EndUsersController < ApplicationController
  def my_page
  	@end_user = EndUser.find(current_end_user.id)
  end

  def edit
  	# @end_user = EndUser.find(current_end_user.id)
  end

  def update
       @end_user = EndUser.find(current_end_user.id)
    if @end_user.update(end_user_params)
       redirect_to my_page_path, notice: "登録情報を変更しました"
    else
       render :edit
    end
  end

  def unsubscribed
  	end_user = EndUser.find(current_end_user.id)
  	end_user.update(is_unsubscribed: true)
  	end_user.destroy
  	reset_session
  	redirect_to root_path, notice: "ありがとうございました。またのご利用を心よりお待ちしております。"
  end

  private
  def end_user_params
  	params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :address, :phone_number, :is_unsubscribed, :email, :password, :password_confirmation)
  end
end