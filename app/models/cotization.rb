class Cotization < ApplicationRecord
  belongs_to :cotizable, polymorphic: true
  belongs_to :client
  belongs_to :conversation
  belongs_to :deal_type
  has_and_belongs_to_many :items, -> { with_deleted }
  after_create :send_notify_cable

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

  def send_notify_cable
    ActionCable.server.broadcast(
      "notifications-#{cotizable.user.id}",
      type: 'new_cotization',
      body: self
    )
    ActionCable.server.broadcast(
      "notifications-#{client.clientable.id}",
      type: 'new_cotization',
      body: self
    )
  end

end
