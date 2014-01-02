json.array!(@awards) do |award|
  json.extract! award, :name, :description, :rules, :sponsor, :sponsor_logo, :enabled
  json.url award_url(award, format: :json)
end
