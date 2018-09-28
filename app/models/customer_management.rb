class CustomerManagement < ApplicationRecord
  include AASM
  belongs_to :profile

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

# Mercantil
# 0412 653 4999
# 22 605 034
