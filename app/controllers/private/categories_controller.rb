class Private::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_category, only: [:edit, :update, :destroy]
  protect_from_forgery except: [:collection]

  def index
    @categories = Category.all
    @category = Category.last
  end

  def new
    @category = Category.new
  end


  def collection
    #TODO refactor !! tranzaction + security + replace
    @category_collection = params.require(:category).values

    @category_collection.each do |item|
      @category = Category.friendly.find(item['id'].to_i)
      ancestry_id = item['ancestry']
      if ancestry_id.present?
        @category.ancestry = Category.friendly.find(ancestry_id.to_i)
      else
        @category.ancestry = nil
      end
      @category.save
    end
    respond_to do |format|
      format.json { render json: { code: 200 }, status: 200 }
    end
  end

  def edit
  end

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
