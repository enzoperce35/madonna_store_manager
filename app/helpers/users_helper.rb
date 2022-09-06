module UsersHelper
  def user_is_app_manager
    user_signed_in? && current_user.username == 'inso'
  end
  
  def user_is_general_manager
    user_signed_in? && current_user.branches.count > 1
  end
  
  def user_is_store_manager
    user_signed_in? && current_user.branches.count == 1
  end
  
  def user_is_not_admin
    user_signed_in? && ( current_user.branches.count.nil? || current_user.branches.count.zero? )
  end
end