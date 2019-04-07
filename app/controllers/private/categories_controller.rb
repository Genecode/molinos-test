class Private::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
    @category = Category.last
  end

  def new
    @category = Category.new
  end

  def update_tree(tree_nodes, parent_node = nil)
    tree_nodes.each do |item|
      node = Category.find(item['id'].to_s)
      node.parent = parent_node || nil
      node.save!(validate: @enable_callback)
      update_tree(item['children'], node) if item.has_key?('children')
    end
  end

  def commit
    update_tree(params.require(:categories))

    respond_to do |format|
      format.json { render json: { code: 200 }, status: 200 }
    end
  end

  def edit; end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to private_root_path, notice: 'Category was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to private_root_path, notice: 'Category was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to private_root_path, notice: 'Category was successfully destroyed.' }
    end
  end

  private

  def set_category
    @category = Category.friendly.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :ancestry, :slug)
  end

end
