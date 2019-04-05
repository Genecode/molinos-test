module ProductsHelper
  def product_image(product)
    product.image.present? ? product.image : asset_path('no_photo.jpg')
  end
end
