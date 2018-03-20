# Pyme model
class Pyme < Profile
  # Relations
  belongs_to :user
  has_many :products, as: :productable

  def self.mines
  	where(type_profile: 'pyme')
  end
end
