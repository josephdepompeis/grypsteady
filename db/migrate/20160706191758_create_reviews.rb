class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :design_id
      t.string :username
      t.string :note
      t.integer :stars
      t.integer :size
      t.integer :comfort
      t.integer :performance
      t.string :gender
      t.string :boolean
      t.string :sport
      t.integer :age
      t.string :size_purchased

      t.timestamps null: false
    end
  end
end
