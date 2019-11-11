class CreateSuperpowers < ActiveRecord::Migration[5.2]
  def change
    create_table :superpowers do |t|
      t.string :name
      t.string :description
      t.string :image
      t.integer :price
      t.references :owner, foreign_key: { to_table: :users }
      t.references :superpower_category, foreign_key: true

      t.timestamps
    end
  end
end
