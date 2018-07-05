json.extract! payment_type, :id, :payment_via, :cart_id, :created_at, :updated_at
json.url payment_type_url(payment_type, format: :json)
