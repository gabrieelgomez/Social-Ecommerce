class WishSerializer < ActiveModel::Serializer
  attributes :id, :name, :budget, :description, :user,
             :wisheable, :priority, :created_time

  def wisheable
    wisheable = object.wisheable
    if wisheable.is_a?(Product)
      object.wisheable.as_json.merge({
        productable_url: wisheable.productable.url,
        wisheable_url: wisheable.productable.url + "/products/#{wisheable.id}"
      })
    elsif wisheable.is_a?(Profile)
      object.wisheable.as_json
    end
    # /v1/:type_profile/:profile_id/products/:id
  end

  def created_time
    object.created_at.strftime("%F / %T")
  end
end
