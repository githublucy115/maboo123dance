class Payment < ActiveRecord::Base
  belongs_to :expense
  def date
    return created_at.to_time.strftime("%m/%d/%Y")
  end
end
