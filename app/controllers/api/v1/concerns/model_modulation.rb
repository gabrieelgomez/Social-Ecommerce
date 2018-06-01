module Api::V1::Concerns::ModelModulation
  extend ActiveSupport::Concern

  private

  def model_name
    params[:type_profile].singularize.camelize.constantize
  end

  # to show and index actions
  def public_productable
    @productable = model_name.find(params[:profile_id])
  end

  # to create, destroy and update
  def current_user_productable
    @productable = model_name.find_by_id_and_user_id(params[:profile_id], current_v1_user.id)
  end

end
