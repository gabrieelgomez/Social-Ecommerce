class Post < ApplicationRecord
  belongs_to :postable, polymorphic: true
  has_many :comments, as: :commentable
  has_many :rates, as: :rateable
end
