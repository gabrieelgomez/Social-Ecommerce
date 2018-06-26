class Post < ApplicationRecord
  belongs_to :postable, polymorphic: true
  has_many :comments, as: :commentable
end
