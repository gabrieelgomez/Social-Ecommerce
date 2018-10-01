class CustomerManagement < ApplicationRecord
  include AASM
  belongs_to :profile
  has_many :clients, as: :ownerable

  aasm :state, column: :state do
    state :inactive, initial: true
    state :active

    event :activate do
      transitions from: :inactive, to: :active
    end

    event :inactivate do
      transitions from: :active, to: :inactive
    end
  end

  def toggle_active_state
    return activate! if inactive?

    inactivate!
  end
end
