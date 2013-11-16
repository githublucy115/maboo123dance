json.array!(@expenses) do |expense|
  json.extract! expense, :student_id, :classorder_id, :amount
  json.url expense_url(expense, format: :json)
end
