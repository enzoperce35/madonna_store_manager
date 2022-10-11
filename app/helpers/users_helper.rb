module UsersHelper
  def user_is_app_manager
    user_signed_in? && current_user.username == 'inso'
  end
  
  def user_is_general_manager
    user_is_admin? && current_user.branch.name == 'General Administration'
  end
  
  def user_is_store_manager
    user_is_admin? && current_user.branch.name != 'General Administration'
  end
  
  def user_is_admin?
    user_signed_in? && !current_user.branch.nil?
  end
  
  def user_is_not_admin
    user_signed_in? && current_user.branch.nil?
  end
end
