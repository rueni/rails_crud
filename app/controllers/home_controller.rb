class HomeController < ApplicationController
  # before user can access a resource
  # we filter out those who are not logged in
  before_filter :authorize

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    puts params # for debugging
    @product = Product.create(product_params)
  end

  def delete
    @product = Product.find(params[:product][:id]).destroy
  end

private

  def product_params
    params.require(:product).permit(:name, :quantity)
  end

end
