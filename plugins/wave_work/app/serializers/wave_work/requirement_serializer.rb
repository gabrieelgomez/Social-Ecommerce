class WaveWork::RequirementSerializer < ActiveModel::Serializer
  attributes :id, :sex, :start_age, :end_age, :address, :minimal_experience,
             :languages, :education_level, :start_salary, :end_salary,
             :request_salary, :job_offer, :created_at, :updated_at

  def job_offer
   object.job_offer
  end

end
