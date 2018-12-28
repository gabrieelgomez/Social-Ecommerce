module Api::V1
  class Intranet::IntranetController < ApiController
    before_action :authenticate_v1_user!

    private

    # Callbacks by intranets, Set intranet by profile current_user
		def set_intranets
			ids = current_v1_user.profiles.map(&:intranet).compact.map(&:id)
			@intranets = Intranet::Intranet.where(id: ids)
		end

		def set_intranet
			@intranet = @intranets.find(params[:intranet_id])
		end

  end
end
