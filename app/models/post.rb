class Post < ApplicationRecord
  acts_as_commentable
  belongs_to :postable, polymorphic: true
  has_many :comments, as: :commentable
  has_many :rates, as: :rateable

  validates :title, :content, :postable, presence: true
end
