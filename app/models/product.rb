class Product < ApplicationRecord
  mount_base64_uploader :cover, ImageUploader
  # mount_base64_uploaders :files, ImageUploader

  attr_accessor :document_data
  cattr_accessor :current_user
  serialize :states_codes
  # Callbacks
    acts_as_commentable
    acts_as_paranoid
    acts_as_taggable_on :tags
    # Notifications
    after_create :create_notify_new_product
    after_save :create_notify_change_price, if: :price_changed?

    # Others
    before_save :create_type_profile, :create_category_ids, :create_locations

  # Relationships
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
  validates_numericality_of :stock, greater_than_or_equal_to: 0

  # scope :public_productable, -> (model_name, profile_id, type_profile) {
  # }
  # def productable_type=(sType)
  #   sType.classify.constantize.to_s
  # end

  ransacker :name, type: :string do
    Arel.sql("unaccent(\"name\")")
  end

  # Methods by filters and searchs
  def links
    profile_id = self.productable.id
    type_profile = self.type_profile.pluralize
    @link = {
      self: "/#{type_profile}/#{profile_id}/products/#{self.id}"
    }
  end

  # Methods by filters and searchs
  def url_get
    profile_id = self.productable.id
    type_profile = self.type_profile.pluralize
    @link = {
      url: "/#{type_profile}/#{profile_id}/products/#{self.id}"
    }
  end

  def is_wished_by_user
    wished = false
    wished = current_user.wishes.pluck(:wisheable_id).include?(id) if current_user
  end

  def owner
    {
      id:           productable.id,
      title:        productable.title,
      type_profile: productable.type_profile
    }
  end

  def wish
    nil
  end

  def create_locations
    self.states_codes   = []
    self.countries_codes = []
    # self.productable.locations.collect do |location|
    #   self.countries_codes.push(location.country_code)
    #   self.states_codes.push([location.country_code, location.state_code])
    # end
    location = productable.locations.first
    self.countries_codes.push(location.country_code)
    self.states_codes.push([location.country_code, location.state_code])
  end

  def create_type_profile
    self.type_profile = self.productable.type_profile.downcase
  end

  def create_category_ids
    self.category_ids = self.subcategories.try(:collect, &:category_id).uniq#.map &:to_s
  end

  def build_products_relations
    Product.find(self.product_relations).as_json(only: [:id, :name, :price, :images]) rescue self.product_relations.as_json
  end

  def search_in? array, location_code
    # self.try(location_code).included_in?(array)
    (self.try(location_code).flatten & array).any?
  end

  def self.search_by_countries_states(products, states, countries)
    products = products.select{|product| product.search_in?(states, :states_codes)} if states
    products = products.select{|product| product.search_in?(countries, :countries_codes)} if countries
    return products
  end

  def last_wish_date
    wishes.sort.reverse.last.created_at.strftime('%Y-%m-%d')
  end
  # End Methods by filters and searchs


  def create_notify_new_product
    model_name = self.productable.type_profile.capitalize
    followers = self.productable.followers_by_type_profile('User', model_name)
    return if followers.nil?
    followers.each do |follower|
      follower.notify type: 'product', metadata: {
        title: "#{self.productable.title} ha añadido el producto #{self.name}"
      }
    end
  end

  def create_notify_change_price
    return if price_before_last_save.nil?
    if price < price_before_last_save
      whishes = self.wishes
      message = "<strong>#{self.name}</strong> ha bajado el precio de <strong>#{price_before_last_save}</strong> a <strong>#{price}</strong>"
      whishes.each do |wish|
        recipient = wish.user
        sender = self
        #Method for create_notify, in order is recipient, sender, type, message
        Notification.create_notify_models(recipient, sender, 'product', message)
      end
    end
  end

  # True or false if a product is wished
  def wished?
    !wishes.empty?
  end

  def total_wishes
    wishes.count
  end

  def self.sorter_by_wish(priority)
    result = all.where.not(stock:0).sort_by { |prof| prof.wishes.size }
    return result if priority == 'low_to_high'
    result.reverse
  end
end
