class Subcategory < ApplicationRecord
  has_and_belongs_to_many :products
  belongs_to :category

  validates :category_id, presence: true

  ransacker :name, type: :string do
    Arel.sql("unaccent(\"name\")")
  end

  def products_charged
    products.count
  end

  def has_product?
    products_charged.positive?
  end

end
