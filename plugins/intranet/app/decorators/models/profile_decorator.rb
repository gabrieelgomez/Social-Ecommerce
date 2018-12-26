Profile.class_eval do
  # Decorators Intranet
  has_one :intranet, class_name: 'Intranet::Intranet', dependent: :destroy
  has_many :memberships, class_name: 'Intranet::Membership'
  has_many :groups, through: :memberships, class_name: 'Intranet::Group', dependent: :destroy

  after_create :create_intranet

  def create_intranet
    Intranet::Intranet.create(
      title: "#{name} :: Intranet",
      profile: self
    )
  end

end
