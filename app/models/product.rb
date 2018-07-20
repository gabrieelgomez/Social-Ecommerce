class Product < ApplicationRecord
  # Callbacks

  mount_base64_uploader :cover, ImageUploader
  attr_accessor :document_data

  after_create :create_notify
  before_save :create_profile, :create_categories, :create_locations
  after_save :set_change_price, if: :price_changed?

  acts_as_taggable_on :tags
  has_many :price_ranges
  has_and_belongs_to_many :custom_fields
  has_and_belongs_to_many :options
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :subcategories
  has_and_belongs_to_many :offers
  # has_and_belongs_to_many :shopping_cars
  has_many :shopping_carts, through: :items
  has_many :items
  belongs_to :productable, polymorphic: true
  has_many :photos, as: :photoable, dependent: :delete_all
  has_many :documents, as: :documentable, dependent: :delete_all
  has_many :wishes, as: :wisheable

  # Validations
  validates :name, :price, :subcategory_ids, presence: true

  # scope :public_productable, -> (model_name, profile_id, type_profile) {
  # }
  # def productable_type=(sType)
  #   sType.classify.constantize.to_s
  # end

  # def mapeo_categorias(params_cat)
  #   self.categories.map{|id| params_cat.include?(id)}.include?(true)
  # end

  def create_locations
    self.states_codes   = self.productable.locations.try(:collect, &:state_code)
    self.countries_codes = self.productable.locations.try(:collect, &:country_code)
  end

  def build_products_relations
    Product.find(self.product_relations).as_json(only: [:id, :name, :price, :images]) rescue self.product_relations.as_json
  end

  def categories_format_id
    self.subcategories.map{|subcat| subcat.category_id }.uniq
  end

  def create_profile
    self.type_profile = self.productable.type_profile.downcase
  end

  def create_categories
    self.category_ids = self.subcategories.try(:collect, &:category_id)#.map &:to_s
  end

  def create_notify
    model_name = self.productable.type_profile.capitalize
    followers = self.productable.followers_by_type_profile('User', model_name)
    return if followers.nil?
    followers.each do |follower|
      follower.notify type: 'product', metadata: {
        title: "#{self.productable.title} ha añadido el producto #{self.name}"
      }
    end
  end

  def set_change_price
    return if price_before_last_save.nil?
    if price < price_before_last_save
      whishes = self.wishes
      message = "#{self.name} ha bajado el precio de #{price_before_last_save} a #{price}"
      whishes.each do |wish|
        #Method for create_notify, in order is recipient, sender, type, message
        Notification.create_notify_models(wish.user, self, 'product', message)
      end
    end
  end

end
