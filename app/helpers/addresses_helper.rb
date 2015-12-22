module AddressesHelper
  def display_address(address)
    address_arr = %w{line_1 line_2 p_o_box county city state_province country zip}
    complete_address = ''
    address_arr.each do |address_attr|
      if address.send(address_attr).present?
        complete_address = complete_address + address.send(address_attr)   + ','
      end
    end
    complete_address.chop!
    address.phones.reload.reverse.each do |phone|
      unless  phone.country_code.blank?
        complete_address = complete_address +  ", +#{phone.country_code} #{phone.phone_number} #{phone.extension}(#{phone.phone_type_cdlk.description})"
      end
    end
    address.emails.reload.reverse.each do |email|
      complete_address = complete_address +  ",#{email.email}(#{email.email_type_cdlk.description})"
    end
    complete_address
  end
end
