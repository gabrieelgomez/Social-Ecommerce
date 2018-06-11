class ShoppingCar < ApplicationRecord
  # Relations
  belongs_to :user

  # Validations
  validates :code, uniqueness: true

  # Callbacks
  before_save :generate_code

  # Generate hex code for shopping car
  def generate_code
    self.code = SecureRandom.hex
  end
end
