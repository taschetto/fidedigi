class Coupon < ActiveRecord::Base
  before_create :generate_token
  after_create :remove_balance_from_points

  belongs_to :promotion
  belongs_to :user

  validate :has_points

  def has_points
    balance = self.user.points_by_company[self.promotion.company]
    if balance < self.promotion.value
      errors.add(:base, I18n.t("errors.insuficient", balance: balance, company: self.promotion.company.name))
    end
  end

  def remove_balance_from_points
    points = self.user.points.
            where("balance > 0").
            where(company: self.promotion.company).
            order("expiration ASC")

    amount = self.promotion.value
    points.each do |point|
      break if amount == 0

      if point.balance >= amount then
        point.balance -= amount
        amount = 0
      else
        amount -= point.balance
        point.balance = 0
      end
      point.save
    end
  end

  def generate_token
    charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    self.code = loop do
      random_token = (0...16).map{ charset.to_a[rand(charset.size)] }.join
      break random_token unless self.class.exists?(code: random_token, redeemed: false)
    end
  end
end
