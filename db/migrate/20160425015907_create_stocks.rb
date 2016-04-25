class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.references :item, index: true, foreign_key: true
      t.references :warehouse, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
