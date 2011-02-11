require 'spec_helper'

describe Category do
  before(:each) do
		@attr = { :name => "Example Category" }
  end

	it "should create a new instance given valid attributes" do
		Category.create!(@attr)
	end

	it "should require a name" do
		no_name_category = Category.new(@attr.merge(:name => ""))
		no_name_category.should_not be_valid
	end

	it "should reject names that are too long" do
		long_name = "a" * 51
		long_name_category = Category.new(@attr.merge(:name => long_name))
		long_name_category.should_not be_valid
  end

  it "should not allow duplicate names with same parent category" do
    parent_category = Category.create(@attr)
    parent_category.move_to_root
    parent_category.should be_valid
    first_child = Category.create(@attr.merge(:name => "First child"))
    first_child.move_to_child_of(parent_category)
    first_child.should be_valid
    second_child = Category.create(@attr.merge(:name => "Second child"))
    second_child.move_to_child_of(parent_category)
    second_child.should be_valid
    second_child.name = first_child.name
    second_child.should_not be_valid
  end

  it "should allow duplicate names with different parents" do
    parent_category_1 = Category.create!(@attr)
    parent_category_1.move_to_root
    parent_category_2 = Category.create!(@attr.merge(:name => "Second parent"))
    parent_category_2.move_to_root
    parent_category_1.should be_valid
    parent_category_2.should be_valid
    first_child = Category.create!(@attr.merge(:name => "First child"))
    first_child.move_to_child_of(parent_category_1)
    first_child.should be_valid
    second_child = Category.create!(@attr.merge(:name => "First child"))
    second_child.move_to_child_of(parent_category_2)
    second_child.should be_valid
  end

  it "should have a products attribute" do
    @category = Category.create(@attr)
    @category.should respond_to(:products)
  end

end

