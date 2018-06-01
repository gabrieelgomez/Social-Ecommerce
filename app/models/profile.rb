class Profile < ApplicationRecord
  acts_as_paranoid

  # Relations
  belongs_to  :user
  has_one     :seller
  has_many    :rates
  has_and_belongs_to_many :categories
  has_many :locations, as: :locatable
  has_many :sended_wishes
  has_many :answer_wishes

  # Validations
  validate    :validate_seller, on: :create
  validates   :user_id, numericality: true
  validates   :user_id, :type_profile, presence: true
  # delegate :pymes, :independents, :sellers, to: :profiles
  self.inheritance_column = :type_profile

  # We will need a way to know which animals
  # will subclass the Animal model
  def self.type_profile
    %w(Pyme Independent Seller)
  end
  
  def validate_seller
    if !User.find(self.user_id).seller.nil? && self.type_profile.downcase.eql?('seller')
      errors.add(:type_profile, 'El usuario ya tiene un perfil seller')
    end
  end

  def products_locations
    self.products.as_json(only: [:id, :name, :price, :images])
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
