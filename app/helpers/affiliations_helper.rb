module AffiliationsHelper

  def nested_party(parties)
    content_tag(:ul) do 
      parties.map do | party |
      	if party.follows.empty?
      	  content_tag(:li, party.name).html_safe
      	else
          content_tag(:li, party.name.html_safe + nested_party(party.follows)).html_safe
        end
      end.reduce(:<<)
    end
  end
 
  # def nested_affiliations(affiliations, root_party, last_node = false)
  #   content_tag(:ul) do 
  #     affiliations.map do | affiliation |
  #         party = affiliation.party
  #         if party.inverse_affiliations.empty?
  #           content_tag :li, link_to_affiliation(affiliation) 
  #         else
  #           unless last_node
  #             last_node = root_party.self? party
  #             content_tag(:li, link_to_affiliation(affiliation)  + nested_affiliations(party.inverse_affiliations, root_party, last_node)).html_safe
  #           else 
  #             #content_tag(:span)
  #             return
  #           end
  #         end
  #     end.reduce(:<<) 
  #   end
  # end 

  def nested_affiliations(affiliations, level = 5)
    level = level - 1    
    content_tag(:ul) do 
      affiliations.map do | affiliation |
        party = affiliation.party
        if party.inverse_affiliations.empty?
          content_tag :li, link_to_affiliation(affiliation) 
        else
          unless level == 0
            content_tag(:li, link_to_affiliation(affiliation)  + nested_affiliations(party.inverse_affiliations, level)).html_safe
          else
            return
          end
        end
      end.reduce(:<<)
    end
  end 

  # def nested_affiliations(affiliations, party = nil)
  #   content_tag(:ul) do 
  #     affiliations.map do | affiliation |
  #     	party = affiliation.party
  #     	if party.inverse_affiliations.empty?
  #     	  content_tag :li, link_to_affiliation(affiliation) 
  #      	else
  #         content_tag(:li, link_to_affiliation(affiliation)  + nested_affiliations(party.inverse_affiliations)).html_safe
  #       end
  #     end.reduce(:<<)
  #   end
  # end  

  def link_to_affiliation(affiliation)
    "#{link_to affiliation.party.name, affiliations_path(:id => affiliation.party.id)} (#{affiliation.affiliation_type})".html_safe
  end

end

