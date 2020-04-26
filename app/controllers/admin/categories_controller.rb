class Admin::CategoriesController < ApplicationController

before_action :authenticate_admin!

  def index
	@category = Category.new
	@categories = Category.all
  end

  def create
  	@category = Category.new(category_params)
  	if @category.save
  		redirect_to request.referer
  	else
  		@categories = Category.all
  		render :index
  	end
  end

  def edit
  	@category = Category.find(params[:id])
  end

  def update
  	category = Category.find(params[:id])
  	category.update(category_params)
  	redirect_to admin_categories_path
  end

  def destroy
  	category = Category.find(params[:id])
  	category.destroy
  	redirect_to admin_categories_path
  end


  private
  def category_params
  	params.require(:category).permit(:name)
  end
end
