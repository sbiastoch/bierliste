json.array!(@categories) do |category|
  json.extract! category, :code, :name, :description
  json.url category_url(category, format: :json)
end