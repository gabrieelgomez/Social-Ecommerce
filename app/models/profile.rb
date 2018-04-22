class Profile < ApplicationRecord
  # Relations
  belongs_to  :user
  has_one     :seller

  # Validations
  validate    :validate_seller, on: :create
  # validate    :validate_profile
  validates   :user_id, numericality: true
  validates   :user_id, :type_profile, presence: true
  # has_and_belongs_to_many :categories

  def validate_profile
    type = self.type_profile.downcase
    if (type != 'seller') || (type != 'pyme') || (type != 'independent')
      errors.add(:type_profile, 'no admitido')
    end
  end

  def validate_seller
    if !User.find(self.user_id).seller.nil? && self.type_profile.downcase.eql?('seller')
      errors.add(:type_profile, 'El usuario ya tiene seller')
    end
  end

  #Metodo para buscar todos los usuarios que siguen a un perfil
  def followers_by_type_profile(follower_type, profile, options={})
    follows = follower_type.constantize.
      joins(:follows).
      where('follows.blocked'         => false,
            'follows.followable_id'   => self.id,
            'follows.followable_type' => profile,
            'follows.follower_type'   => follower_type)
    if options.has_key?(:limit)
      follows = follows.limit(options[:limit])
    end
    if options.has_key?(:includes)
      follows = follows.includes(options[:includes])
    end
    follows
  end

end


# Profile.create(user_id:8, type_profile: 3, name: 'vendedor 1')
#
# Profile.create(user_id:1, type_profile: 1, name: 'pymes 1')

# user.profiles.find_by_type_profile(3).seller

# listado de pyme seller indepen sin login
