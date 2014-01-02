json.array!(@submission_details) do |submission_detail|
  json.extract! submission_detail, :submission_id, :file_url
  json.url submission_detail_url(submission_detail, format: :json)
end
