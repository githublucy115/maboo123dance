json.array!(@class_records) do |class_record|
  json.extract! class_record, :cost, :date
  json.url class_record_url(class_record, format: :json)
end
