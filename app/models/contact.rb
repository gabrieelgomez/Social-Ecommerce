class Contact < ApplicationRecord
  belongs_to :contact_type
  belongs_to :profile, optional: true

  validates :name, :email, :comments, presence: true
end
