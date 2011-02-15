Factory.define :category do |category|
  category.name     "Sample category"
end

Factory.define :product do |product|
  product.name      "Sample product"
  product.category { |category| category.association(:category, :name => "Sample category") }
end
