class Photo < ApplicationRecord
  mount_base64_uploader :photo, ImageUploader
  belongs_to :photoable, polymorphic: true
  validates :photo, presence: true
end
