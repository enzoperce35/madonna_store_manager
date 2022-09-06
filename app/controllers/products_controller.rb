class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new( product_params )

    if product.save
      redirect_back( fallback_location: products_path, notice: "#{ product.name } has been successfully added" )
    else
      redirect_back( fallback_location: products_path, notice: 'failed to save new product' )
    end
  end

  def edit
    @product = Product.find( params[ :id ] )
  end

  def update
    product = Product.find( params[ :id ] )

    if product.update( product_params )
      redirect_to products_path, method: 'get', notice: "edit successful"
    else
      redirect_back( fallback_location: products_path, notice: 'edit failed' )
    end
  end

  def show
    @product = Product.find( params[ :id ] )
  end

  def destroy
    product = Product.find( params[ :id ] )

    if product.destroy
      redirect_to products_path, method: 'get', notice: "#{ product.name } has been deleted"
    else
      redirect_back( fallback_location: products_path, notice: 'delete failed' )
    end
  end

  private

  def product_params
    params.require( :product ).permit( :name )
  end
end
