class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  # Friendly ID
  extend FriendlyId
  friendly_id :nickname, use: [:slugged, :finders]

  # mount_uploader :avatar, ImageUploader
  mount_base64_uploader :avatar, ImageUploader

  validates :email, :nickname, uniqueness: true
  validates :email, email_format: { message: 'Invalid email' }

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
  has_many :rates
  has_many :wishes
  has_many :saved_offers
  has_many :sended_wishes
  has_many :messages, as: :messageable
  has_many :conversations, as: :senderable
  has_one  :shopping_cart
  # has_many :saved_offers, class_name: 'Offer', foreign_key: 'saved_offer_id'

  # Callbacks
  after_create :create_shopping_cart
  before_save  :set_url

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

  # Returns a follow record for the current instance and followable object.
  def get_follow_by_profile(followable, profile)
    self.follows.unblocked.for_followable_by_profile(followable, profile).first
  end

  def create_shopping_cart
    # byebug
    @shop_cart = ShoppingCart.new(user: self)
    @shop_cart.save!
  end

  def send_request_password_change
    token = SecureRandom.hex(3)
    self.update(custom_token: token, request_change_password: Time.now)
    ResetPassword.send_token(self).deliver_now
  end

  def set_url
    self.url = "/v1/users/#{self.slug}"
  end

end
