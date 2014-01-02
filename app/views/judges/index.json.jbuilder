json.array!(@judges) do |judge|
  json.extract! judge, :user_id, :category_id, :division_id
  json.url judge_url(judge, format: :json)
end
