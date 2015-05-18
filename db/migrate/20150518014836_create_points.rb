class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.references :company, index: true, foreign_key: true
      t.decimal :balance
      t.datetime :expiration
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
