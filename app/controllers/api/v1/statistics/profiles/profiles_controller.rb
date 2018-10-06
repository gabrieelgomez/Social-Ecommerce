module Api::V1::Statistics
	class Profiles::ProfilesController < StatisticsController

		private

		def set_my_profile
			@profile = custom_find {
				current_v1_user.profiles.find(params[:profile_id])
			}
		end

		def model_name
			@profile.class.to_s
		end

    def quantity_cotization_messages(initial, last)
      @profile.cotizations.date_between(initial, last).count
    end

    def quantity_products_wishes(initial, last)
      current_v1_user.wishes.products.date_between(initial, last).count
    end

    def quantity_products_offers(initial, last)
      Offer.where(id: @profile.product_ids).date_between(initial, last).count
    end

    def quantity_users_rates(initial, last)
      @profile.rates.date_between(initial, last).count
    end

    def quantity_conversations(initial, last)
      @profile.conversations.date_between(initial, last).count
    end

    def quantity_followers(initial, last)
      @profile.followers_by_type_profile('User', model_name).ransack(created_at_gteq: initial, created_at_lteq: last).result.count
    end

  end
end
