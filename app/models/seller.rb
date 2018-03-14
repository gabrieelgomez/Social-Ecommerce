class Seller < Profile
  # Relations
  belongs_to :user

  # def self.all
  #   Profile.where(type_profile: 'seller')
  # end
end
