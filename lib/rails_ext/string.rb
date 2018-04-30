class String
  def modelarize
    singularize.camelize.constantize
  end

  def params_to_a
    gsub(/[\[\]]/, '').split(',').map!(&:to_i)
  end
end
