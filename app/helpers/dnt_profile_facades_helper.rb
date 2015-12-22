module DntProfileFacadesHelper
  def get_checked_radio(source,field)
    source.send(field).nil? ? true : false
  end

  def get_values(source)
    source.blank? ? '' : source.uniq.map(&:text).join('`')
  end
end
