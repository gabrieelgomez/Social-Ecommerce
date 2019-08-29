class EducationalDescription < ApplicationRecord
  belongs_to :educationable, polymorphic: true

  before_save :add_coins

  def add_coins
    average = [institution.blank?, degree.blank?, academic_discipline.blank?, note.blank?, activities_groups.blank?, start_date.blank?, end_date.blank?, current.blank?, description.blank?, files.blank?]
    if average.count(false) >= 8 && !half_coins
      @type = "80% datos completados de educational description #{self.institution}"
      @amount = 80
      create_transaction
      self.half_coins = true
    elsif average.count(false) >= 10 && !all_coins
      @type = "100% datos completados de educational description #{self.institution}"
      @amount = 100
      create_transaction
      self.all_coins = true
    end
  end

  def create_transaction
    @transaction = Transaction.new(
      amount: @amount,
      reference: SecureRandom.hex(6),
      type_transfer: @type,
      status: 'paid',
      user: educationable,
      wallet: educationable.wallets.first,
      coin: educationable.wallets.first.coin
    )
  end

end
