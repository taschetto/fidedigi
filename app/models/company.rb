class Company < ActiveRecord::Base
  belongs_to :manager
  has_many :clerks
  has_many :vouchers
  has_many :points
end