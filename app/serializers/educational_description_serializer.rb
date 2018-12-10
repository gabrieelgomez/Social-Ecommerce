class EducationalDescriptionSerializer < ActiveModel::Serializer
  attributes :id, :institution, :degree, :academic_discipline, :note, :activities_groups, :start_date, :end_date, :current, :description, :files, :half_coins, :all_coins, :educationable
  # attributes *EducationalDescription.column_name

end
