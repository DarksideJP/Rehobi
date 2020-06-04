class Admin::ExamplesController < ApplicationController

before_action :authenticate_admin!

  def index
    @examples_all = Example.where(is_release: :true)
    @examples = @examples_all.page(params[:page])
  end

  def show
    @example = Example.find(params[:id])
  end

  def new
    @example = Example.new
  end

  def create
    @example = Example.new(example_params)
    # binding.pry
    if @example.save
      redirect_to admin_example_path(@example)
    else
      render :new
    end
  end

  def update
    @example = Example.find(params[:id])
    # binding.pry
    if @example.update(example_params)
      if params[:example][:is_release]
        @examples = Example.where(is_release: :false)
        @examples.each do |example|
          example.destroy
        end
      end
      redirect_to admin_example_path(@example)
    else
      render :edit
    end
  end

  def edit
    @example = Example.find(params[:id])
  end

  def destroy
    @example = Example.find(params[:id])
    @example.destroy
    redirect_to admin_examples_path
  end

  private
  def example_params
    params.require(:example).permit(:before_image, :after_image, :category_id, :title, :body, :is_release)
  end
end
