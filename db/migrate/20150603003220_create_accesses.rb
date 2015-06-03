class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.date :accessed_at, index: true, unique: true
      t.integer :access_count

      t.timestamps null: false
    end
  end
end
