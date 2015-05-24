class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.references :company, index: true, foreign_key: true
      t.date :expiration
      t.integer :value
      t.integer :availability
      t.string :title
      t.string :description
      t.string :image

      t.timestamps null: false
    end
  end
end
