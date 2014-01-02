json.array!(@score_details) do |score_detail|
  json.extract! score_detail, :score_id, :points, :score_item_id
  json.url score_detail_url(score_detail, format: :json)
end
