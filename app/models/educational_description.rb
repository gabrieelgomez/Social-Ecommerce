class EducationalDescription < ApplicationRecord
  belongs_to :educationable, polymorphic: true
end
