json.extract! product, :id, :name, :desc, :image, :active, :created_at, :updated_at
json.url product_url(product, format: :json)
