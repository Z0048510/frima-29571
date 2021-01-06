class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :productname, null: false
      t.integer :amount, null: false
      t.string :description, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :payment_id, null: false
      t.integer :area_id, null: false
      t.integer :day_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
