class AddCompanyToClerk < ActiveRecord::Migration
  def change
    add_reference :clerks, :company, index: true, foreign_key: true
  end
end
