class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :before_price, default: 0
      t.integer :after_price, default: 0
      t.string :availiability, default: "In Stock"
      t.string :image, null: false
      t.text :description, null: false
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
