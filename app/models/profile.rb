class Profile < ApplicationRecord
  belongs_to  :user
  has_one     :seller
  validate    :validate_seller
  validate    :validate_profile
  validates   :user_id, numericality: true
  validates   :user_id, :type_profile, presence: true

  def validate_profile
    type = self.type_profile.downcase
    if (type != "seller") || (type != "pyme") || (type != "independently")
      errors.add(:type_profile, "no admitido")
    end
  end

  def validate_seller
    if !User.find(self.user_id).seller.nil? && self.type_profile.downcase.eql?("seller")
      errors.add(:type_profile, "El usuario ya tiene seller")
    end
  end

end


# Profile.create(user_id:8, type_profile: 3, name: 'vendedor 1')
#
# Profile.create(user_id:1, type_profile: 1, name: 'pymes 1')

# user.profiles.find_by_type_profile(3).seller


#listado de pyme seller indepen sin login
