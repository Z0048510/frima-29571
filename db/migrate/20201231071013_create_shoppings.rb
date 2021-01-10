class CreateShoppings < ActiveRecord::Migration[6.0]
  def change
    create_table :shoppings do |t|
      t.references :purchase, foreign_key: true
      t.string :postnumber, null: false
      t.integer :area_id, null: false
      t.string :municipality, null: false
      t.string :address, null: false
      t.string :buildingname, null: false
      t.string :phonenumber, null: false
      t.timestamps
    end
  end
end
