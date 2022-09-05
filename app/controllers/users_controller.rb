class UsersController < ApplicationController
  def user_branch
    user = User.find( params[ :id ] )

    if user.update( user_params )
      redirect_to root_path, notice: 'User branch successfuly updated'
    else
      redirect_back( fallback_location: root_path, notice: 'User branch not updated' )
    end
  end

  private

  def user_params
    params.require( :user ).permit( :name, branch_ids: [] )
  end
end
