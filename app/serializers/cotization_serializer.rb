class CotizationSerializer < ActiveModel::Serializer
  attributes :id, :price, :currency, :stage, :status, :created_at, :updated_at, :details, :client, :cotizable, :products#, :items

  # belongs_to :cotizable, polymorphic: true
  # belongs_to :user

  def client
    object.client.clientable.as_json(only: %i[id email name nickname avatar banner country description dni
                                              gender lastname phone_one phone_two slug uid url created_at])
  end

  def cotizable
    object.cotizable.as_json(only: %i[id title user_id slug photo phone email description country created_at
                                      address banner])
  end

  def products
    object.items.collect{|item| item.product}.as_json(only: %i[id name description price cover stock created_at],
                                                      methods: %i[options])
  end

end
