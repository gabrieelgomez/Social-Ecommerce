class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :date_between, -> (start_date, end_date) do
    ransack(created_at_gteq: start_date, created_at_lteq: end_date).result
  end

end
