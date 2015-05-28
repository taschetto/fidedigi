class Clerks::CouponsController < ApplicationController
  layout "layouts/clerks/application"
  before_action :authenticate_clerk!
  respond_to :html, :json

  def blah
  end

  def redeem
    @coupon = Coupon.find_by(code: coupon_params[:code], redeemed: false)
    if @coupon.nil? then
      flash[:error] = t("errors.invalid_coupon")
      redirect_to clerks_blah_path
    else
      @coupon.redeemed = true
      @coupon.save
      respond_with(@coupon)
    end
  end

private
  def coupon_params
    params.require(:coupon).permit(:code)
  end
end
