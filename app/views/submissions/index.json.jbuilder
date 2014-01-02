json.array!(@submissions) do |submission|
  json.extract! submission, :category_id, :user_id, :organization_id, :division_id, :contest_year, :notes, :approved, :physical_version_received, :digital_version_received, :disqualify
  json.url submission_url(submission, format: :json)
end
