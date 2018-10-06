class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :avatar, :phone, :lastname, :description,
             :dni, :created_by

  def name
    validate_presence_attr(:name)
  end

  def email
    validate_presence_attr(:email)
  end

  def avatar
    validate_presence_attr(:avatar)
  end

  def created_by
    case object.created_by
    when 1 then 'cotization'
    when 2 then 'regular'
    when 3 then 'manually'
    else ''
    end
  end

  # Reduce code
  def validate_presence_attr(symbol)
    return object[symbol] if (object.clientable.nil? && object[symbol].blank?)

    object.clientable[symbol]
  end
end
