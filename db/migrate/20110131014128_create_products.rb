class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.references :category
      t.integer :rank, :default => 1
      t.decimal :default_price, :precision => 8, :scale => 2
      t.decimal :default_weight, :precision => 6, :scale => 2
      t.text :html, :null => true
      t.timestamps
    end

		add_index :products, :category_id, :name => 'products_category_id'
  end

  def self.down
		remove_index :products, 'products_category_id'
    drop_table :products
  end
end
