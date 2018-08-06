class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.text :name
      t.text :address
      t.text :email
      t.text :description
      t.integer :price
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
