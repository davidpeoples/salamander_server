class Category < ActiveRecord::Base
	acts_as_nested_set

	def full_name
		category_tree = []
		self.self_and_ancestors.each { |v| category_tree << v.name }
		category_tree.join(", ")
	end

	def valid_parents
		if self.id.nil? then
			Category.all(:order => "lft")
		else
			valid_parents = []
			Category.all(:order => "lft").each { |v|
				valid_parents << v if ! v.is_or_is_descendant_of?(self)
			}
			valid_parents
		end
	end
	
	def Category.valid_parents(id)
		if id.nil? then
			Category.all(:order => "lft")
		else
			existing_category = Category.find(id)
			valid_parents = []
			Category.all(:order => "lft").each { |v|
				valid_parents << v if ! v.is_or_is_descendant_of?(existing_category)
			}
			valid_parents
		end
	end

end
