class PolicyTerm < ApplicationRecord
  mount_base64_uploader :file, DocumentUploader
  # validates :file, presence: true
end
