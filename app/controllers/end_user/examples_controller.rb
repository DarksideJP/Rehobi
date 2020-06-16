class EndUser::ExamplesController < ApplicationController
  def index
    @categories = Category.all
    if params[:id]
      @category = Category.find(params[:id])
      @examples_narrow = @category.examples.where(is_release: :true)
      @examples = @examples_narrow.page(params[:page])
    else
      @examples_all = Example.where(is_release: :true)
      @examples = @examples_all.page(params[:page])
    end
  end

  def show
  	@example = Example.find(params[:id])
  end
end
