class Manager < ApplicationRecord
  
  def self.send_diffusion(superadmin, users, message)
    users.map do |user|
      conversation = Conversation.get(superadmin, user)
      conversation.update(type_messages: 'manager')
      conversation.messages.create(
        messageable: superadmin,
        body: message
      )
    end
  end
end