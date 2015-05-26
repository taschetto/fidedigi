class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :points
  has_many :coupons

  def points_by_company
    points = Hash.new(0)
    self.points.
      where("balance > 0").
      where("expiration >= ?", Date.today).
      each do |point|
      points[point.company] += point.balance
    end
    points
  end
end
