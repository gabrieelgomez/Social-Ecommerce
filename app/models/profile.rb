class Profile < ApplicationRecord
  acts_as_paranoid
  # attr_accessor :type_profile
  after_create :create_social_account_and_schedule

  # mount_base64_uploader :photo, :banner, ImageUploader

  # Relations
  belongs_to  :user
  has_one     :seller
  has_one     :social_account
  has_one     :schedule
  has_many    :rates
  has_and_belongs_to_many :categories
  has_many :locations, as: :locatable
  has_many :sended_wishes
  has_many :answer_wishes

  # Validations
  # validate    :validate_seller, on: :create
  validates   :user_id, numericality: true
  validates   :user_id, :title, :category_ids, presence: true
  # delegate :pymes, :independents, :sellers, to: :profiles
  self.inheritance_column = :type_profile

  # We will need a way to know which animals
  # will subclass the Animal model
  def self.type_profile
    %w[Pyme Independent Seller]
  end

  def validate_seller
    if !User.find(self.user_id).seller.nil? && self.type_profile.downcase.eql?('seller')
      errors.add(:type_profile, 'El usuario ya tiene un perfil seller')
    end
  end

  def products_locations(var_bool, product_ids)
    return custom_json(product_ids) if var_bool
    self.products.as_json(only: [:id, :name, :price, :images])
  end

  def custom_json(product_ids)
    self.products.select{|product| product_ids.include?(product.id)}.as_json(only: [:id, :name, :price, :images])
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
  def self.short_ransack(categories, search)
    ransack(categories_id_in: categories).result
    .ransack(name_or_description_or_title_cont: search).result
  end


  def create_social_account_and_schedule
    SocialAccount.create(profile: self)
    Schedule.create(profile: self)
  end

end
