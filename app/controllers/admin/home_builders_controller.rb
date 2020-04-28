class Admin::HomeBuildersController < ApplicationController

before_action :authenticate_admin!

  def index
  end

  def new
  	@home_builder = HomeBuilder.new
  end

  def create
  	@home_builder = HomeBuilder.new(home_builder_params)
  	# binding.pry
  	if @home_builder.save
  		redirect_to admin_home_builders_path, notice: "登録が完了しました"
  	else
  		render :new
  	end
  end

  def index
  	@home_builders = HomeBuilder.all
  end

  def edit
  	@home_builder = HomeBuilder.find(params[:id])
  end

  def update
  	home_builder = HomeBuilder.find(params[:id])
  	home_builder.update(home_builder_params)
  	redirect_to admin_home_builders_path
  end

  def destroy
  	home_builder = HomeBuilder.find(params[:id])
  	home_builder.destroy
  	redirect_to admin_home_builders_path
  end

  private
  def home_builder_params
  	params.require(:home_builder).permit(:name, :area)
  end
end
