class PointsController < ApplicationController
  respond_to :html, :json

  def redeem
    @voucher = Voucher.find_by(code: voucher_params[:code], redeemed: false)
    @voucher.redeem(current_user) unless @voucher.nil?
    respond_with(@voucher)
  end

private
  def voucher_params
    params.require(:voucher).permit(:code)
  end
end
