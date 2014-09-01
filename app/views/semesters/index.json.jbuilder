json.array!(@semesters) do |semester|
  json.extract! semester, :start, :end, :cash, :bank, :active
  json.url semester_url(semester, format: :json)
end