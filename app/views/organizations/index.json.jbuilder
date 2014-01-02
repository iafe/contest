json.array!(@organizations) do |organization|
  json.extract! organization, :name, :primary_contact, :address_line_1, :address_line_2, :city, :state_province, :country, :zip_code, :phone, :fair, :enabled
  json.url organization_url(organization, format: :json)
end
