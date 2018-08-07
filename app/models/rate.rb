class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :rateable, polymorphic: true
  after_save :update_score_rateable

  validates :score, numericality: { less_than_or_equal_to: 5,  greater_than_or_equal_to: 1}

  def self.score_validate_user(user, rateable)
    user.rates.find_by(rateable: rateable)
  end

  def update_score_rateable
    rateable = self.rateable
    new_score = rateable.rates.average(:score).to_f
    update(score: new_score)
  end

end
