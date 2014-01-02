json.array!(@scores) do |score|
  json.extract! score, :user_id, :submission_id, :total_score, :comments, :disqualify
  json.url score_url(score, format: :json)
end
