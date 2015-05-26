class CouponsController < ApplicationController
  layout "layouts/application"
  before_action :authenticate_user!
  before_action :set_coupon, only: [:show]

  respond_to :html, :json

  def index
    @coupons = current_user.coupons
    respond_with(@coupons)
  end

  def show
    @coupon = Coupon.find(params[:id])
    respond_with(@coupon)
  end

  private

    def set_coupon
      @coupon = Coupon.find(params[:id])
    end
end
