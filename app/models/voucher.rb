class Voucher < ActiveRecord::Base
  before_create :generate_token

  belongs_to :company
  belongs_to :clerk

  def generate_token
    self.code = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless self.class.exists?(code: random_token)
    end
  end
end
