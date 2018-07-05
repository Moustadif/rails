json.extract! billing_address, :id, :street, :city, :state, :zip, :cart_id, :created_at, :updated_at
json.url billing_address_url(billing_address, format: :json)
