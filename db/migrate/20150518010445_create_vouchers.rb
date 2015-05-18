class CreateVouchers < ActiveRecord::Migration
  def change
    create_table :vouchers do |t|
      t.string :code
      t.references :company, index: true, foreign_key: true
      t.datetime :expiration
      t.decimal :monetary_value
      t.integer :points
      t.boolean :redeemed
      t.references :clerk, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
