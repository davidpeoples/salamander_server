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

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end

		it "should have the right title" do
			get 'new'
			response.should have_selector("title",
																		:content => @base_title + "New Product")
		end

  end

#  describe "GET 'edit'" do
#    it "should be successful" do
#      get 'edit'
#      response.should be_success
#    end
#  end

  describe "POST 'create'" do

    describe "failure" do

      before(:each) do
        @category = Factory(:category)
        @attr = { :name => "", :category_id => @category.id }
      end

      it "should not create a product" do
        lambda do
          post :create, :product => @attr
        end.should_not change(Product, :count)
      end

      it "should have the right title" do
        post :create, :product => @attr
        response.should have_selector("title", :content => "New Product")
      end

      it "should render the 'new' page" do
        post :create, :product => @attr
        response.should render_template('new')
      end

    end

    describe "success" do

      before(:each) do
        @category = Factory(:category)
        @attr = { :name => "New product", :category_id => @category.id }
      end

      it "should create a product" do
        lambda do
          post :create, :product => @attr
        end.should change(Product, :count).by(1)
      end

      it "should redirect to the products page" do
        post :create, :product => @attr
        response.should redirect_to(products_path)
      end

      it "should have a flash message" do
        post :create, :product => @attr
        flash[:success].should =~ /product was successfully created/i
      end

#      it "should be successful" do
#        get 'create'
#        response.should be_success
#      end
      
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
