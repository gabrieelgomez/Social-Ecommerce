module Api::V1::WaveEducational::Concerns::ModelModulationEducational
  extend ActiveSupport::Concern

  private

  def model_symbol
    params[:type_profile].to_sym
  end

  def model_name
    WaveEducational::Teacher
  end

  # to show and index actions
  def public_productable
    @productable = model_name.find(params[:profile_id])
  end

  # to create, destroy and update
  def current_user_productable
    @productable = model_name.find_by_id_and_user_id(params[:profile_id], current_v1_user.id)
    validate_roles if @productable.nil?
  end

  def validate_roles
    profile = Profile.find(params[:profile_id]) rescue Profile
    permission = current_v1_user.has_role? [:admin, :editor], profile
    @productable = profile if permission
    render json: {errors: 'Access denied'} unless permission
  end

end
