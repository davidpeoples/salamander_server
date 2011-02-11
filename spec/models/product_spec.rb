require 'spec_helper'

describe Product do
	
	before(:each) do
		@category = Factory(:category)
		@attr = { :name => "Example product" }
	end

	it "should create a new instance given valid attributes" do
    @category.products.create!(@attr)
	end
	
	it "should require a name" do
		no_name_product = @category.products.new(@attr.merge(:name => ""))
		no_name_product.should_not be_valid
	end

  it "should not allow duplicate product names in one category" do
    first_product = @category.products.create(@attr)
    second_product = @category.products.create(@attr.merge(:name => "Other product"))
    second_product.should be_valid
    second_product.name = first_product.name
    second_product.should_not be_valid
  end

  it "should allow duplicate product names in different categories" do
    @another_category = Factory(:category, :name => "Another category")
    first_product = @category.products.create(@attr)
    second_product = @another_category.products.create(@attr)
    second_product.should be_valid
  end

end
