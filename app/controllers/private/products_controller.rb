class Private::ProductsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_category, only: [:create]

  def index
    @category = Category.friendly.find(params[:category_id])
    @products = @category.products
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end


  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to private_category_products_path(@product.category), notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to private_product_path(@product), notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to private_root_path, notice: 'Product was successfully destroyed.' }
    end
  end

  private

  def set_product
    @product = Product.friendly.find(params[:id])
  end

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end

  def product_params
    params.require(:product).permit(:name, :slug, :category, :category_id, :image, :description)
  end
end
