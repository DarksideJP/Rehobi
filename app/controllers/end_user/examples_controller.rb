class EndUser::ExamplesController < ApplicationController
  def index
  	@examples = Example.where(is_release: :true)
  end

  def show
  	@example = Example.find(params[:id])
  end
end
