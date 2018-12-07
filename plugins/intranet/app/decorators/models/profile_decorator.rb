Profile.class_eval do
  # Decorators Intranet
  has_one :intranet, class_name: 'Intranet::Intranet', dependent: :destroy
  has_many :memberships, class_name: 'Intranet::Membership'
  has_many :groups, through: :memberships, class_name: 'Intranet::Group', dependent: :destroy
end
