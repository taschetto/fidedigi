class Voucher < ActiveRecord::Base
  before_create :generate_token

  belongs_to :company
  belongs_to :clerk
  belongs_to :point

  validate :value


  def redeem(user)
    return if self.redeemed

    point = Point.find_or_create(self.company, user, self.expiration)
    point.balance += self.points
    self.point = point
    self.redeemed = true

    point.save && self.save
  end

  def value
    if self.monetary_value <= 0
      errors.add(:monetary_value, I18n.t("errors.positive"))
    elsif self.monetary_value < self.company.minimum_value then
      errors.add(:monetary_value, I18n.t("errors.minimum", minimum: self.company.minimum_value))
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
