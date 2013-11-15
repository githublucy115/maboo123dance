json.array!(@classrecords) do |classrecord|
  json.extract! classrecord, :cost, :date
  json.url classrecord_url(classrecord, format: :json)
end
