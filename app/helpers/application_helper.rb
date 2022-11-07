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

  


  def type_groupings_of( records, arr = [])
    item_types = records.pluck( :item_type )

    item_types.uniq.each do | type |
      group = records.where( item_type: type ).order( :name )

      arr << [ type, group ]
    end
    
    arr
  end

  def link_to_add_row( name, f, association, **args )
    new_object = f.object.send( association ).klass.new
    id = new_object.object_id
    fields = f.simple_fields_for( association, new_object, child_index: id ) do |builder|
      render( association.to_s.singularize, identifier: id, f: builder )
    end
    link_to(name, '#', class: "add_fields " + args[:class], id: 'add-item', data: {id: id, fields: fields.gsub("\n", "")})
  end

  def last_updated( queries )
    queries.order( :updated_at ).last
  end

  def compliance_class_of( object )
    verified_and_complete?( object ) ? 'comp-obj' : 'incomp-obj'
  end

  def user_branch
    return '' if !user_signed_in? || current_user.branch.nil?

    if user_is_store_manager
      ' - ' + current_user.branch.name
    elsif user_is_general_manager
      ' - ' + 'Admin'
    else
      ''
    end
  end
end
