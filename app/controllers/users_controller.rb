class UsersController < ApplicationController
  def user_branch
    user = User.find( params[ :id ] )

    branch = Branch.find( params[ :branch_user ][ :branch_id ] )
    
    user.branch = branch

    redirect_to root_path, notice: 'User Branch Updated'
  end
end
