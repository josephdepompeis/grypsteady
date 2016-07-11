class CreateShippings < ActiveRecord::Migration
  def change
    create_table :shippings do |t|
      t.string :name
      t.string :adr_1
      t.string :adr_2
      t.string :state
      t.integer :zip
      t.integer :total
      t.integer :cart_id
      t.timestamps null: false
    end
  end
end
