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
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      # handle success
    else
      @title = "New Product"
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

end
