class CustomField < ApplicationRecord
  belongs_to :product
  belongs_to :customizable, polymorphic: true
end
