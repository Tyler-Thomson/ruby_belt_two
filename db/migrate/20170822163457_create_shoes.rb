class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.float :price
      t.references :seller, index: true
      t.references :buyer, index: true

      t.timestamps null: false
    end
  end
end
