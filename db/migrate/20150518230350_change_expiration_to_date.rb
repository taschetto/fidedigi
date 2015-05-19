class ChangeExpirationToDate < ActiveRecord::Migration
  def change
    change_column :vouchers, :expiration,  :date
    change_column :points, :expiration,  :date
  end
end
