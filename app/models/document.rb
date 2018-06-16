class Document < ApplicationRecord
  belongs_to :product
  mount_uploader :document, DocumentUploader
end
