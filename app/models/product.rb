# == Schema Information
# Schema version: 20110131014128
#
# Table name: products
#
#  id             :integer(4)      not null, primary key
#  name           :string(255)
#  category_id    :integer(4)
#  rank           :integer(4)      default(1)
#  default_price  :decimal(8, 2)
#  default_weight :decimal(6, 2)
#  html           :text
#  created_at     :datetime
#  updated_at     :datetime
#

class Product < ActiveRecord::Base

	belongs_to :category

	attr_accessible :name, :default_price, :default_weight, :html

	validates :name,	:presence => true,
										:length => { :maximum => 50 }
  validates_uniqueness_of :name, :scope => :category_id
	validates_associated :category
	validates_presence_of :category
	
end
