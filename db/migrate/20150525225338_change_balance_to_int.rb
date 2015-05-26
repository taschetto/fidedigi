class ChangeBalanceToInt < ActiveRecord::Migration
  def change
    change_column :points, :balance, :integer
  end
end
