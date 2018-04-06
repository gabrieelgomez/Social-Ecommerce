class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  #User followable with other users
  acts_as_followable
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
end
