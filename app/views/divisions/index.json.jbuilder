json.array!(@divisions) do |division|
  json.extract! division, :name, :division_smallest, :division_largest, :description
  json.url division_url(division, format: :json)
end
