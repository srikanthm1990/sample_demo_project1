module FeaturedMarketingOpportunitiesHelper

  def get_collapsed_values(fmo)
        content_tag(:span,truncate_to_20(fmo.title),class: 'col-md-3') +
        content_tag(:span,fmo.header.truncate(15), class: 'col-md-3') +
        content_tag(:span,truncate_to_20(fmo.footer), class: 'col-md-3') if fmo.present?
  end

  def truncate_to_20(fld)
    fld.truncate(20) unless fld.nil?
  end
  
end