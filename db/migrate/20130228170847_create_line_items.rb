class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |line_item|
      line_item.integer :cart_id
      line_item.integer :product_id
      line_item.timestamps
    end
  end
end
