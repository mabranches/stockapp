class AddNewColumnsToItems < ActiveRecord::Migration
  def change
    add_column :items, :sku, :string
    add_column :items, :image, :string
    add_column :items, :priec, :decimal, precision: 8, scale: 2
  end
end
