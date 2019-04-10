class Cotization < ApplicationRecord
  belongs_to :cotizable, polymorphic: true
  belongs_to :client
  belongs_to :conversation
  belongs_to :deal_type
  has_and_belongs_to_many :items, -> { with_deleted }

  validates_inclusion_of :stage, :in => %w(sent received answered sold lost)

  def clientable
    client.clientable
  end

  def details
    data = []
    self.items.each do |item|
      data.push(
        product_id: item.product_id,
        name: item.product.name,
        options_values: item.option_values,
        quantity: item.quantity
      )
    end
    data
  end

end
