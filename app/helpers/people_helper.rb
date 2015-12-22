module PeopleHelper
  def display_person_detail(person)
    complete_person = ''
    @full_name =  (person.prefix_cdlk.nil? ? '' : select_description('PrefixCdlk',person.prefix_cdlk)) + " #{person.first_name}" + " #{person.middle_name}" + " #{person.last_name}" + ' ' +  (person.suffix_cdlk.nil? ? '' : select_description('SuffixCdlk',person.suffix_cdlk))
    unless person.job_title.blank?
      complete_person = complete_person + ' ,' +  person.job_title
    end
    person.phones.reload.reverse.each do |phone|
      unless  phone.country_code.blank?
        complete_person = complete_person +  ", +#{phone.country_code} #{phone.phone_number} #{phone.extension}(#{phone.phone_type_cdlk.description})"
      end
    end
    person.emails.reload.reverse.each do |email|
      complete_person = complete_person +  ",#{email.email}(#{email.email_type_cdlk.description})"
    end
    @full_name + complete_person
  end
end