module NavigationHelper

  def active?(*paths)
    active = false  	
  	paths.each { |path| active ||= request.url.include?(path) }
    active 
  end 
  
  def party_active?
    active?(parties_path, 
    	    listings_path, 
    	    affiliations_path, 
    	    images_path,
          listing_services_path) ? 'active' : nil
  end

  def utility_active?
    active?(code_lookups_path,
    	    content_types_path,
    	    characteristics_path,
    	    structures_path,
    	    segment_drivers_path,
    	    media_types_path,
    	    users_path,
    	    relationships_path
    	   ) ? 'active' : nil
  end

end
