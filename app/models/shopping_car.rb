class ShoppingCar < ApplicationRecord
  # Relations
  belongs_to :user
  has_and_belongs_to_many :products

  # Validations
  validates :code, uniqueness: true
  # validates :user_id, uniqueness: true, on: :create

  # Callbacks
  before_save :generate_code

  # Generate hex code for shopping car
  def generate_code
    self.code = SecureRandom.hex
  end
end
