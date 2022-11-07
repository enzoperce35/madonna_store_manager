module BranchesHelper
  
  # Names the general administration branch 'Warehouse' for inventory item instances
  def branch_name_of( branch )
    branch.name == 'General Administration' ? 'Warehouse' : branch.name
  end
end
