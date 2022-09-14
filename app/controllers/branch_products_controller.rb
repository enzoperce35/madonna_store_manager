class BranchProductsController < ApplicationController
  # store managers choose their branch's products from the main lists of all products

  def index
    @list = params[ :list ]
    @branch = current_user.branches.first
    @products = Product.all.order( :name )
    @branch_products = BranchProduct.where( branch_id: @branch.id )
  end

  def edit
    @branch_product = BranchProduct.find( params[ :id ] )
  end

  def update
    branch_product = BranchProduct.find( params[ :id ] )

    if branch_product.update( branch_product_params )
      redirect_to branch_products_path, notice: "#{ branch_product.product.name } updated"
    else
      redirect_back( fallback_location: root_path, notice: "update failed" )
    end
  end

  def update_branch_products_list
    branch = Branch.find( params[ :id ] )

    if branch.update( branch_product_params )
      redirect_to branch_products_path, notice: "#{ branch.name } products updated"
    else
      redirect_to root_path, notice: "update failed"
    end
  end

  private

  def branch_product_params
    params.require( :branch_product ).permit( :category, :price, product_ids: [] )
  end
end
