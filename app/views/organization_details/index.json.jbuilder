json.array!(@organization_details) do |organization_detail|
  json.extract! organization_detail, :organization_id, :fair_start_date, :fair_end_date, :total_attendance
  json.url organization_detail_url(organization_detail, format: :json)
end
