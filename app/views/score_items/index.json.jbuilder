json.array!(@score_items) do |score_item|
  json.extract! score_item, :name, :description, :category_id, :max_points
  json.url score_item_url(score_item, format: :json)
end
