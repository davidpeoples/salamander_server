class ProductsController < ApplicationController
  def index
		@title = "Products"
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @title = "Product \"" + @product.name + "\""
  end

  def new
		@title = "New Product"
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

end
