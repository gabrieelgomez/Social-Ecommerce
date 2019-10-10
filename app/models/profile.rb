class Profile < ApplicationRecord
  cattr_accessor :current_user

  acts_as_paranoid
  acts_as_commentable
  resourcify
  # Friendly ID
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  # attr_accessor :type_profile
  after_create :create_crm
  after_create :create_social_account_and_schedule
  before_save :set_url#, :create_locations

  mount_base64_uploader :photo, ImageUploader
  mount_base64_uploader :banner, ImageUploader

  # scope :cotizations do
  #   # where(senderable: current_user).or(where(recipientable: current_user))
  # end

  # scope :cotizations, joins(:conversations).where(type_messages: 'cotizations')

  # Relations
  belongs_to  :user
  has_one     :customer_management, dependent: :destroy
  has_one     :seller
  has_many    :posts, as: :postable
  has_one     :social_account
  has_one     :schedule
  has_many    :rates, as: :rateable
  has_and_belongs_to_many :categories
  has_many :locations, as: :locatable
  has_many :cotizations, as: :cotizable
  has_many :wishes, as: :wisheable
  has_many :sended_wishes
  has_many :answer_wishes
  # has_many :job_offers
  has_many :contacts, dependent: :destroy

  # Validations
  # validate    :validate_seller, on: :create
  validates :slug, uniqueness: true
  validates :user_id, numericality: true
  validates :user_id, :title, :category_ids, presence: true

  validate :create_location, on: :update

  def create_location
    case self.locations.count
      when nil
        errors.add(:location_prominent, 'Location must exist minimum one')
      else
        prominents = self.locations.where(prominent: true).count
        if prominents.zero?
          errors.add(:location_prominent, 'Location should be prominent minimum one')
        elsif prominents > 1
          errors.add(:location_prominent, 'Location should be prominent one')
        end
    end
  end

  ransacker :title, type: :string do
    Arel.sql("unaccent(\"title\")")
  end

  # delegate :pymes, :independents, :sellers, to: :profiles
  self.inheritance_column = :type_profile

  # Callbacks
  def self.type_profile
    %w[Pyme Independent Seller]
  end

  def change_type(valid_type)
    return unless self.class.type_profile.include?(valid_type)

    update(type_profile: valid_type.capitalize)
    self
  end

  def validate_seller
    unless User.find(self.user_id).seller.nil? && self.type_profile.downcase.eql?('seller')
      errors.add(:type_profile, 'El usuario ya tiene un perfil seller')
    end
  end

  # Create custome_management after profile creation
  def create_crm
    build_customer_management
  end
  # ------------

  def cotizations
    conversations.where(type_messages: 'cotizations')
  end
  # Short way to call customer_management relations
  def crm
    customer_management
  end

  # Fecha de nacimiento: 16 de Octubre de 1997
  # Teléfono: 0412 966 4338
  # Estado Civil: Soltero
  # # de hijos: 0

  def clients
    crm.clients
  end

  # Method by used services (#7) home
  def products_categories(id)
    self.products.select { |product| product.category_ids.include?(id) }.count
  end
  # ------------

  def is_followed_by_user
    followed = false
    followed = current_user.follow_by_profile(model_name.to_s).pluck(:id).include?(self.id) if current_user
  end

  # Method by used GPS services/model
  def products_locations(var_bool, product_ids)
    return custom_json(product_ids) if var_bool

    self.products.as_json(only: %i[id name price images])
  end
  # ------------


  # Method by used Search services/model
  def self.short_ransack(categories, search)
    ransack(categories_id_in: categories).result
    .ransack(description_or_title_cont_or_slug_cont: search).result
  end
  # ------------


  # ----------------------------------
  # Methods by seed or create profile
  def create_social_account_and_schedule
    SocialAccount.create(profile: self)
    Schedule.create(profile: self)
  end

  def create_locations
    self.states_codes   = []
    self.countries_codes = []
    self.locations.collect do |location|
      self.countries_codes.push(location.country_code)
      self.states_codes.push([location.country_code, location.state_code])
    end
    self.update(states_codes: self.states_codes, countries_codes: self.countries_codes)
  end

  def search_in? array, location_code
    return if self.try(location_code).nil?
    # self.try(location_code).included_in?(array)
    (self.try(location_code).flatten & array).any?
  end

  def self.search_by_countries_states(profiles, states, countries)
    profiles = profiles.select{|profile| profile.search_in?(states, :states_codes)} if states
    profiles = profiles.select{|profile| profile.search_in?(countries, :countries_codes)} if countries
    return profiles
  end

  def countries_codes
    self.locations.map(&:country_code).uniq
  end

  def states_codes
    codes = []
    self.locations.collect do |location|
      codes.push([location.country_code, location.state_code])
    end
    codes.uniq
  end
  # ----------------------------------


  # ----------------------------------
  # Methods by custom fields response
  def set_url
    self.url = "/v1/#{self.type_profile.downcase.pluralize}/#{self.slug}"
  end

  def follow
    false
  end

  def custom_json(product_ids)
    self.products.select{|product| product_ids.include?(product.id)}.as_json(only: [:id, :name, :price, :images])
  end

  def name
    title
  end

  def type
    'Profile'
  end

  def custom_avatar
    photo
  end

  # ----------------------------------


  # Metodo para buscar todos los usuarios que siguen a un perfil
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

  # We will need a way to know which animals
  # will subclass the Animal model
  def root_comments
    Comment.where(
      commentable_id: id,
      commentable_type: type_profile.capitalize,
      parent_id: nil
    )
  end
  # ----------------------------------


end
