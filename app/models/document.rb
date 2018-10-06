class Document < ApplicationRecord
  mount_base64_uploader :document, DocumentUploader
  # belongs_to :product
  belongs_to :documentable, polymorphic: true
  validates :document, presence: true
end
