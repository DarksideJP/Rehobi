class EndUser::ExamplesController < ApplicationController
  def index
  	# @examples = Example.where(is_release: :true)
  	@examples_all = Example.where(is_release: :true)
  	@examples = @examples_all.page(params[:page])

  end

  def show
  	@example = Example.find(params[:id])
  end
end
