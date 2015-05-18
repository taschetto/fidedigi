class AddPointToVoucher < ActiveRecord::Migration
  def change
    add_reference :vouchers, :point, index: true, foreign_key: true
  end
end
