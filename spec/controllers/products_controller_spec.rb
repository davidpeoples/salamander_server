require 'spec_helper'

describe ProductsController do
	render_views

	before(:each) do
		@base_title = "Salamander Server | "
	end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end

		it "should have the right title" do
			get 'index'
			response.should have_selector("title",
																		:content => @base_title + "Products")
		end

  end

  describe "GET 'show'" do

    before(:each) do
      @product = Factory(:product)
    end

    it "should be successful" do
      get :show, :id => @product
      response.should be_success
    end

    it "should find the right product" do
      get :show, :id => @product
      assigns(:product).should == @product
    end

  end

#  describe "GET 'new'" do
#    it "should be successful" do
#      get 'new'
#      response.should be_success
#    end
#
#		it "should have the right title" do
#			get 'new'
#			response.should have_selector("title",
#																		:content => @base_title + "New Product")
#		end
#
#  end

#  describe "GET 'edit'" do
#    it "should be successful" do
#      get 'edit'
#      response.should be_success
#    end
#  end

  describe "GET 'create'" do
    it "should be successful" do
      get 'create'
      response.should be_success
    end
  end

#  describe "GET 'update'" do
#    it "should be successful" do
#      get 'update'
#      response.should be_success
#    end
#  end

#  describe "GET 'destroy'" do
#    it "should be successful" do
#      get 'destroy'
#      response.should be_success
#    end
#  end

end
