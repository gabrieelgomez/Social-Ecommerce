class Rate < ApplicationRecord
  acts_as_commentable
  belongs_to :user
  belongs_to :rateable, polymorphic: true
  has_many :comments, as: :commentable
  after_save :score_rateable_up

  validates :score, numericality: { less_than_or_equal_to: 5,  greater_than_or_equal_to: 1}

  def self.score_validate_user(user, rateable)
    user.rates.find_by(rateable: rateable)
  end

  def score_rateable_up
    rateable = self.rateable
    new_score = rateable.rates.average(:score).to_f
    rateable.update(score: new_score)
  end

end
