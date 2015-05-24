class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :code
      t.references :promotion, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :redeemed

      t.timestamps null: false
    end
  end
end
