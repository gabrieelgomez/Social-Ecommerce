class Seller < Profile
  # Relations
  belongs_to :user
  has_many :products, as: :productable
  # def self.all
  #   Profile.where(type_profile: 'seller')
  # end
end
