module ApplicationHelper

  def parent_view
    "\u{276E}".encode( 'utf-8') * 2
  end

  def product_available_on?( branch, product )
    BranchProduct.exists?( product_id: product.id, branch_id: branch.id )
  end
  
  def price_of?( branch, product )  # inactive: to be used for unque branch pricing
    product = BranchProduct.find_by( product_id: product.id, branch_id: branch.id )

    product.nil? ? 'NA' : product.price
  end

  def prices_of( product, prices = {} )  # inactive: to be used for unique branch pricing
    branches = Branch.all

    branches.each do | branch |
      price = price_of?( branch, product )

      prices.store( branch.name, price )
    end

    prices
  end

  

  def last_updated( queries )
    queries.order( :updated_at ).last
  end

  def compliance_class_of( object )
    verified_and_complete?( object ) ? 'comp-obj' : 'incomp-obj'
  end

  
  
  
  
  
  
  
end
