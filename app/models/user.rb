class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  mount_base64_uploader :avatar, AvatarUploader

  validates :email, :nickname, uniqueness: true
  validates :email, :email_format => { :message => 'Invalid email' }

  #Helper para permitir que el modelo pueda ser seguido por otros modelos
  acts_as_followable
  #Helper para permitir que el modelo pueda seguir a otros modelos
  acts_as_follower

  # --- Relations ---
  # Pymes
  has_many :pymes, -> { where(type_profile: 'pyme') },
           class_name: 'Pyme'
  # Independents
  has_many :independents, -> { where(type_profile: 'independent') },
           class_name: 'Independent'
  # Seller
  has_one  :seller, -> { where(type_profile: 'seller') },
           class_name: 'Seller'

  has_many :offers

   #Metodo para seguir Profiles by users
   def follow_profile(followable, profile)
     if self != followable
       params = {followable_id: followable.id, followable_type: profile}
       self.follows.where(params).first_or_create!
     end
   end

   #Metodo por buscar perfiles seguidos by user
   def follow_by_profile(model)
     self.follows_by_type(model).map{|fl| fl.followable}
   end

   #Metodo para dejar de seguir a un profile
   def stop_following_by_profile(followable, profile)
     if follow = get_follow_by_profile(followable, profile)
       follow.destroy
     end
   end

   # Returns a follow record for the current instance and followable object.
   def get_follow_by_profile(followable, profile)
     self.follows.unblocked.for_followable_by_profile(followable, profile).first
   end

end
