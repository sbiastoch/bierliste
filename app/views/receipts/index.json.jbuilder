json.array!(@receipts) do |receipt|
  json.extract! receipt, :category_id, :description, :date, :type, :amount
  json.url receipt_url(receipt, format: :json)
end