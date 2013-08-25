json.array!(@users) do |user|
  json.extract! user, :email, :password_digest, :name
  json.url user_url(user, format: :json)
end
