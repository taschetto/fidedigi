class AddMinimumToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :minimum_value, :decimal
  end
end
