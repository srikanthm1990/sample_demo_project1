module BanksHelper
  def set_bank_label
    current_user.is_bank_admin? ? 'My Bank' : 'Banks'
  end

  def set_add_show_bank_link
    employee = current_user.employee.employable if current_user.employee.present?
    if current_user.is_bank_admin? && !employee.present?
      new_bank_path
    elsif current_user.is_banking_professional? && employee.present?
      bank_path(@bank)      
    else
      banks_path
    end
  end
end
