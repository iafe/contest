json.array!(@users) do |user|
  json.extract! user, :first_name, :last_name, :suffix, :email, :phone, :password_digest, :admin, :judge, :enabled
  json.url user_url(user, format: :json)
end
