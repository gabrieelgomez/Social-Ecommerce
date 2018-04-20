module Api::V1::Concerns::ModelModulation
  extend ActiveSupport::Concern

  private

  def model_name
    params[:type_profile].singularize.camelize.constantize
  end

  # to show and index actions
  def public_productable
    @productable = model_name.find_by_id_and_type_profile(params[:profile_id],
                                                          params[:type_profile].singularize)
  end

  # to create, destroy and update
  def current_user_productable
    @productable = model_name.find_by_id_and_type_profile_and_user_id(params[:profile_id],
                                                                      params[:type_profile].singularize,
                                                                      current_v1_user.id)
  end

end
