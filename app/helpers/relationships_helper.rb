module RelationshipsHelper

  def nested_characteristic(characteristics)
    content_tag(:ul) do 
      characteristics.map do | characteristic |
      	if characteristic.follows.empty?
      	  content_tag(:li, characteristic.name).html_safe
      	else
          content_tag(:li, characteristic.name.html_safe + nested_characteristic(characteristic.follows)).html_safe
        end
      end.reduce(:<<)
    end
  end


  def nested_relationships(relationships, level = 5)
    level = level - 1    
    content_tag(:ul) do 
      relationships.map do | relationship |
        characteristic = relationship.characteristic
        if characteristic.inverse_relationships.empty?
          content_tag :li, link_to_relationship(relationship) 
        else
          unless level == 0
            content_tag(:li, link_to_relationship(relationship)  + nested_relationships(characteristic.inverse_relationships, level)).html_safe
          else
            return
          end
        end
      end.reduce(:<<)
    end
  end 

  def nested_childrens(relationships, level = 5)
    level = level - 1    
    content_tag(:ul, :class=> "#{level == 3 ? 'child':''}") do 
      relationships.map do | relationship |
        characteristic = relationship.follower
        if characteristic.relationships.empty?
          content_tag :li, link_to_follower(relationship) 
        else
          unless level == 0
            content_tag(:li, link_to_follower(relationship)  + nested_childrens(characteristic.ordered_relations, level)).html_safe
          else
            return
          end
        end
      end.reduce(:<<)
    end
  end  

  def link_to_relationship(relationship)
    "#{link_to_delete(relationship)} [#{relationship.characteristic.type}] #{link_to relationship.characteristic.name, relationships_path(:id => relationship.characteristic.id)}".html_safe
  end

  def link_to_myself(relationship)
    relation_type = ''
    relation_type = "(#{relationship.relationship_type})" if relationship.characteristic.is_a_media_type?
    "[#{relationship.follower.type}] #{relation_type} #{link_to relationship.follower.name, relationships_path(:id => relationship.follower.id)}".html_safe
  end 

  def link_to_follower(relationship)
    relation_type = ''
    relation_type = "(#{relationship.relationship_type})" if relationship.characteristic.is_a_media_type?
    "#{link_to_delete(relationship)} [#{relationship.follower.type}] #{relation_type} #{link_to relationship.follower.name, relationships_path(:id => relationship.follower.id)}".html_safe
  end 

  def link_to_delete(relationship)
  	"#{link_to 'x', relationship, method: :delete, data: { confirm: 'Remove relationship?' }, :class => 'btn btn-default btn-xs'  }"
  end 

  def link_to_delete_safe(relationship)
    "#{link_to 'x', relationship, method: :delete, data: { confirm: 'Remove relationship?' }, :class => 'btn btn-default btn-xs'  }".html_safe
  end   

end

