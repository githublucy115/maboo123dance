json.array!(@transactions) do |transaction|
  json.extract! transaction, :student_id, :classrecord_id, :amount
  json.url transaction_url(transaction, format: :json)
end
