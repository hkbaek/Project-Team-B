json.array!(@users) do |user|
  json.extract! user, :email, :hashed_password, :salt, :name
  json.url user_url(user, format: :json)
end
