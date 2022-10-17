class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :card_number, null: false
      t.integer :card_exp_month, null: false
      t.integer :card_exp_year, null: false
      t.integer :card_cvc, null: false
      t.integer :postal_code, null: false
      t.integer :prefecture_id, null:false
      t.string :city, null:false
      t.string :addresses, null:false
      t.string :building
      t.integer :phone_number, null:false

      t.timestamps
    end
  end
end
