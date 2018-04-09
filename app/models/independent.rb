# Independently model
class Independent < Profile
  # Relations
  belongs_to :user
  has_many :products, as: :productable

  def self.mines
  	where(type_profile: 'independent')
  end

  def self.by_owner(current_user)
  	where('type_profile = ? and user_id = ?', 'independent', current_user)
  end
end
