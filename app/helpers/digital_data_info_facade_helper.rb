module DigitalDataInfoFacadeHelper

  def get_cdlk_id(source)
    source.uniq.map(&:code_lookup_id).join('`') unless source.blank?
  end

  def get_cdlk_desc(source)
    source.uniq.map(&:override_desc).join('`') unless source.blank?
  end

end
