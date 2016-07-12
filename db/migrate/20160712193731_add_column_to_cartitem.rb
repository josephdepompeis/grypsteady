class AddColumnToCartitem < ActiveRecord::Migration
  def change
    add_column :cart_items, :color, :string
  end
end
