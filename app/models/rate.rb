class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  after_save :update_score_profile

  validates :score, numericality: { less_than_or_equal_to: 5,  greater_than_or_equal_to: 1}

  def self.score_validate_user(user, profile)
    user.rates.find_by(profile: profile)
  end

  def update_score_profile
    profile = self.profile
    new_score = profile.rates.average(:score).to_f
    profile.update(score: new_score)
  end

end
