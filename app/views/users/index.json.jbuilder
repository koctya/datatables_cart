json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :phone, :address, :city, :state, :string, :zip
  json.url user_url(user, format: :json)
end
