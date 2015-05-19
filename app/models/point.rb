class Point < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  has_many :vouchers

  def self.find_or_create(company, user, expiration)
    point = Point.find_by(company: company, user: user, expiration: expiration)
    point = Point.create company: company,
                         user: user,
                         expiration: expiration,
                         balance: 0 if point.nil?
    point
  end
end
