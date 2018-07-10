class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :senderable, :recipientable, :messages

  def recipientable
    class_name = self.object.recipientable.class.name
    if class_name == 'Pyme' || class_name == 'Seller' || class_name == 'Independent'
      recip = self.object.recipientable
      asd = {
        type_profile: recip.type_profile
      }
      return recip.as_json.merge(asd)
    else
      return self.object.recipientable.as_json
    end
  end

  def senderable
    class_name = self.object.senderable.class.name
    if class_name == 'Pyme' || class_name == 'Seller' || class_name == 'Independent'
      recip = self.object.senderable
      asd = {
        type_profile: recip.type_profile
      }
      return recip.as_json.merge(asd)
    else
      return self.object.senderable.as_json
    end
  end
end
