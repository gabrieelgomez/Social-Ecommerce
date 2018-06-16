class Document < ApplicationRecord
  belongs_to :product
  mount_base64_uploader :document, DocumentUploader
end
