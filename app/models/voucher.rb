class Voucher < ActiveRecord::Base
  before_create :generate_token

  belongs_to :company
  belongs_to :clerk
  belongs_to :point

  def generate_token
    charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    self.code = loop do
      random_token = (0...16).map{ charset.to_a[rand(charset.size)] }.join
      break random_token unless self.class.exists?(code: random_token, redeemed: false)
    end
  end
end
