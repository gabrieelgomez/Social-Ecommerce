class Cotization < ApplicationRecord
  belongs_to :cotizable, polymorphic: true
  belongs_to :client
  belongs_to :conversation
  belongs_to :deal_type
  has_and_belongs_to_many :items, -> { with_deleted }
  after_create :send_notify_cable
  after_update :send_changes

  accepts_nested_attributes_for :items

  validates_inclusion_of :stage, :in => %w(received answered sold lost)

  def clientable
    client.clientable
  end

  def details
    data = []
    self.items.each do |item|
      data.push(
        item_id: item.id,
        product_id: item.product_id,
        name: item.product.name,
        options_values: item.option_values,
        quantity: item.quantity
      )
    end
    data
  end

  def products
    self.items.collect{|item| item.product}
  end

  def send_changes
    @data = {
      type: 'changed_cotization',
      body: {
        cotization: self.as_json(
          only: [
            :id, :price, :currency, :stage, :status, :created_at, :updated_at
          ], methods: [
            :details, :clientable, :cotizable, :products
          ]
        ),
        conversation_id: self.conversation.id
      }
    }
    ActionCable.server.broadcast(
      "conversations-#{self.cotizable.user.id}",
      @data
    )

    ActionCable.server.broadcast(
      "conversations-#{self.client.clientable.id}",
      @data
    )

  end

  def send_notify_cable
    set_cotizable
    set_clientable
  end

  def set_cotizable
    Conversation.current_user = cotizable
    @data = {
      type: 'new_cotization',
      body: self.conversation.as_json(
        only: [
          :id
        ], methods: [
          :type_conversation, :open, :sender_messageable, :receptor_messageable
        ],
          include: {
            messages:{
              only: %i[id body read conversation_id image file messageable_type messageable_id created_at update_at]
            },
            cotization: {
              only: %i[id cotizable_type cotizable_id client_id price status stage token currency address text created_at conversation_id],
              methods: [:details]
            }
          }
      )
    }

    ActionCable.server.broadcast(
      "conversations-#{self.cotizable.user.id}",
      @data
    )
  end

  def set_clientable
    Conversation.current_user = client.clientable
    @data = {
      type: 'new_cotization',
      body: self.conversation.as_json(
        only: [
          :id
        ], methods: [
          :type_conversation, :open, :sender_messageable, :receptor_messageable
        ],
          include: {
            messages:{
              only: %i[id body read conversation_id image file messageable_type messageable_id created_at update_at]
            },
            cotization: {
              only: %i[id cotizable_type cotizable_id client_id price status stage token currency address text created_at conversation_id],
              methods: [:details]
            }
          }
      )
    }

    ActionCable.server.broadcast(
      "conversations-#{self.client.clientable.id}",
      @data
    )
  end

end
