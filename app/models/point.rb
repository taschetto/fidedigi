class Point < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  has_many :vouchers
end
