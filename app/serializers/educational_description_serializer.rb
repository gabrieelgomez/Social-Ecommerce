class EducationalDescriptionSerializer < ActiveModel::Serializer
  attributes :id, :institution, :degree, :academic_discipline, :note, :activities_groups, :start_date, :end_date, :current, :description, :files, :educationable
  # attributes *EducationalDescriptions.column_name

end
