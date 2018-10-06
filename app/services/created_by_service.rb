class CreatedByService

  def self.build_client(ownerable, clientable, client_type)
    @client = Client.new(
      ownerable: ownerable,
      clientable: clientable,
      created_by: type_selection(client_type)
    )
    @client.save!
  end

  class << self
    private def type_selection(type)
      case type
      when 'cotization' then 1
      else 2
      end
    end
  end
end

