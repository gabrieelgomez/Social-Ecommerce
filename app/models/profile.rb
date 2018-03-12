class Profile < ApplicationRecord
  belongs_to  :user
  has_one     :seller
  after_save :create_seller

  def create_seller
    if self.type_profile.eql?(3)
      Seller.create(
        profile_id: self.id,
        user_id:    self.user_id
      )
    end
  end
end


# Profile.create(user_id:8, type_profile: 3, name: 'vendedor 1')
#
# Profile.create(user_id:1, type_profile: 1, name: 'pymes 1')

# user.profiles.find_by_type_profile(3).seller


#listado de pyme seller indepen sin login
