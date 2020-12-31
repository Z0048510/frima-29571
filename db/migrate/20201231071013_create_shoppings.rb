class CreateShoppings < ActiveRecord::Migration[6.0]
  def change
    create_table :shoppings do |t|
      t.integer :purchase_id, null: false
      t.string :postnumber, null: false
      t.integer :prefectures_id, null: false
      t.string :municipality, null: false
      t.string :address, null: false
      t.string :buildingname, null: false
      t.string :phonenumber, null: false
      t.timestamps
    end
  end
end
