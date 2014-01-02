json.array!(@user_organizations) do |user_organization|
  json.extract! user_organization, :user_id, :organization_id, :primary
  json.url user_organization_url(user_organization, format: :json)
end
