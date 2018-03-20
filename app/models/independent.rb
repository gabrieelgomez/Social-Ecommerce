# Independently model
class Independent < Profile
  # Relations
  belongs_to :user
  has_many :products, as: :productable

  def self.mines
  	where(type_profile: 'independent')
  end
end
