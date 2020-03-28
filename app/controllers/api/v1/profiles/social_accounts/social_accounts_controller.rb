module Api::V1::Profiles
  class SocialAccounts::SocialAccountsController < ProfilesController
    before_action :authenticate_v1_user!, except: [:show]
		before_action :set_profile, only: [:show, :update]

		def show
			render json: @profile.social_account
		end

		def update
      @profile.social_account.update(social_account_params)
      if @profile.social_account.save
        render json: @profile.social_account,
               status: 200
      else
        render json: @profile.social_account.errors, status: 422
      end
    end

		private
    
		def social_account_params
      params.require(:social_account).permit(:facebook, :twitter, :instagram, :google_plus,
																	 :tripadvisor, :pinterest, :flickr, :behance,
																 	 :dribbble, :tumblr, :github, :linkedin, :soundcloud,
																   :youtube, :skype, :vimeo)
    end

  end
end
