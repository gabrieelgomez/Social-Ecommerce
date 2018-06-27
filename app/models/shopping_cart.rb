class ShoppingCart < ApplicationRecord
  # Relations
  belongs_to :user
  # has_and_belongs_to_many :products
  has_many :products, through: :items
  has_many :items

  # Validations
  validates :code, uniqueness: true
  # validates :user_id, uniqueness: true, on: :create

  # Callbacks
  before_save :generate_code

  # Generate hex code for shopping car
  def generate_code
    self.code = SecureRandom.hex
  end

  def full_product
    User.first.as_json(root: true, only: [:name])
  end
end
