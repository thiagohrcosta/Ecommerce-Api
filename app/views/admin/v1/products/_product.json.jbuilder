json.(product, :id, :name, :description, :price, :status)
json.image_url rails_blop_url(product.image)
json.productable product.product_type.underscore
json.categories product.categories.pluck(:name)
