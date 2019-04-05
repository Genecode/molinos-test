class CategoriesController < ApplicationController
  before_action :set_category, only: :show

  def index
    @categories = Category.roots
  end

  def show; end

  private

  def set_category
    @category = Category.friendly.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
