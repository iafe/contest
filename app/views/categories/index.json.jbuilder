json.array!(@categories) do |category|
  json.extract! category, :name, :code, :award_id, :document_max_number, :photo_max_number, :video_max_number, :max_total_file_size, :description, :rules, :enabled
  json.url category_url(category, format: :json)
end
