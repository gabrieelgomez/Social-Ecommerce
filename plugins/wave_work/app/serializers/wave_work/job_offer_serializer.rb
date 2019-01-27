class WaveWork::JobOfferSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :country, :state, :address, :vacancies,
             :copy_cv, :profile, :area, :type_hierarchy, :type_job, :created_at, :updated_at

  def profile
    object.profile.as_json(only: %i[id title slug photo name type_profile], methods: %i[category_ids])
  end

  def area
   object.area
  end

  def type_job
   object.type_job
  end

  def type_hierarchy
   object.type_hierarchy
  end

end
