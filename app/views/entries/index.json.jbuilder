json.array!(@entries) do |entry|
  json.extract! entry, :receipt, :date, :description, :amount
  json.url entry_url(entry, format: :json)
end