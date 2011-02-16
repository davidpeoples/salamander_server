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
    @product = Product.find(params[:id])
  end

  def create
    @category = Category.find(params[:product][:category_id])
    @product = @category.products.build(params[:product])
    respond_to do |format|
      if @product.save
        format.html { redirect_to(products_path, :flash => { :success => 'Product was successfully created.' } ) }
        format.xml  { head :ok }
      else
        format.html { @title = "New Product"; render 'new' }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
   end

  def update
    @product = Product.find(params[:id])
    @product.category = Category.find(params[:product][:category_id])
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(products_path, :flash => { :success => 'Product was successfully updated.' } ) }
        format.xml  { head :ok }
      else
        format.html { render 'edit' }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url, :notice => "Product was deleted") }
      format.xml  { head :ok }
    end
  end

end
