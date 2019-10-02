class User < ActiveRecord::Base
  rolify strict: true
  attr_accessor :current_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :omniauthable, omniauth_providers: [:google_oauth2]
  include DeviseTokenAuth::Concerns::User

  # Friendly ID
  extend FriendlyId
  friendly_id :nickname, use: [:slugged, :finders]

  # mount_uploader :avatar, ImageUploader
  mount_base64_uploader :avatar, ImageUploader
  mount_base64_uploader :banner, ImageUploader


  validates :email, :nickname, uniqueness: true
  validates :email, email_format: { message: 'Invalid email' }

  after_create :create_wallet

  # Helper para permitir que el modelo pueda ser seguido por otros modelos
  acts_as_followable
  # Helper para permitir que el modelo pueda seguir a otros modelos
  acts_as_follower

  # Notifications Target
  notification_target

  # --- Relations ---
  # Pymes
  has_many :pymes, -> { where(type_profile: 'Pyme') },
           class_name: 'Profile'
  # Independents
  has_many :independents, -> { where(type_profile: 'Independent') },
           class_name: 'Profile'
  # Seller
  has_one  :seller, -> { where(type_profile: 'Seller') },
           class_name: 'Profile'
  has_many :profiles
  has_many :offers
  has_many :rates, as: :rateable
  has_many :wishes
  has_many :saved_offers
  has_many :sended_wishes
  has_many :messages, as: :messageable
  has_many :conversations, as: :senderable
  has_many :membership_conversations, as: :memberable
  has_one  :shopping_cart
  has_many :posts, as: :postable
  has_many :cotizations
  has_many :educational_descriptions, as: :educationable, dependent: :delete_all
  has_many :wallets
  has_many :transactions
  has_many :locations, as: :locatable

  # has_many :saved_offers, class_name: 'Offer', foreign_key: 'saved_offer_id'

  def cotizations
    Cotization.select{|x| x.client.clientable_id == self.id}
  end

  def search_in? array, location_code
    (self.try(location_code).flatten & array).any?
  end

  def countries_codes
    codes = []
    locations.collect do |location|
      codes.push(location.country_code)
    end
    codes
  end

  def states_codes
    codes = []
    locations.collect do |location|
      codes.push([location.country_code, location.state_code])
    end
    codes
  end


  # Callbacks
  after_create :create_shopping_cart
  before_save  :set_url

  # Methods by generate wallet default coin wave
  def create_wallet
    Wallet.create(
      token: SecureRandom.hex(12),
      balance: 10,
      user: self,
      coin_id: 1
    )
  end

  # Metodo para crear wallets a usuarios existentes antes del modulo
  def create_default_wallets
    Wallet.create(token: SecureRandom.hex(12), balance: 10, user_id: self.id, coin_id: 1) if self.wallets.blank? && Wallet.between(self.id,1).blank?
  end

  # Metodo para seguir Profiles by users
  def follow_profile(followable, profile)
    if self != followable
      params = {followable_id: followable.id, followable_type: profile}
      self.follows.where(params).first_or_create!
    end
  end

  # Metodo por buscar perfiles seguidos by user
  def follow_by_profile(model)
    self.follows_by_type(model).map{|fl| fl.followable}
  end

  # Metodo para dejar de seguir a un profile
  def stop_following_by_profile(followable, profile)
    if follow = get_follow_by_profile(followable, profile)
      follow.destroy
    end
  end

  def conv_membership?(conv)
    membership_conversations.where(conversation: conv).exists?
  end

  # Returns a follow record for the current instance and followable object.
  def get_follow_by_profile(followable, profile)
    self.follows.unblocked.for_followable_by_profile(followable, profile).first
  end

  def create_shopping_cart
    @shop_cart = ShoppingCart.new(user: self)
    @shop_cart.save!
  end

  def send_request_password_change
    token = SecureRandom.hex(3)
    self.update_columns(custom_token: token, request_change_password: Time.now)
    ResetPassword.send_token(self).deliver_now
  end

  def set_url
    self.url = "/v1/users/#{self.slug}"
  end

  def type
    'User'
  end

  def custom_avatar
    avatar.url
  end

  def map_suggest(type)
    self.wishes.map{|wish| wish.wisheable.category_ids if wish.wisheable_type == type}.flatten.uniq.reject!(&:nil?)
  end

end
