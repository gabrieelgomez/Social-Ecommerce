class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :senderable, :recipientable, :messages, :type_messages

  # def profiles
  #   # @user = self.object.senderable if self.object.senderable.is_a? User 
  # end

  def recipientable
    class_name = self.object.recipientable.class.name
    if class_name == 'Pyme' || class_name == 'Seller' || class_name == 'Independent'
      recip = self.object.recipientable
      asd = {
        type_profile: recip.type_profile
      }
      return recip.as_json.merge(asd)
    else
      return self.object.recipientable
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
      return self.object.senderable
    end
  end
end
