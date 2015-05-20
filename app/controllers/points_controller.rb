class PointsController < ApplicationController
  layout "layouts/application"
  before_action :authenticate_user!

  respond_to :html, :json

  def new
  end

  def redeem
    @voucher = Voucher.find_by(code: voucher_params[:code], redeemed: false)
    if @voucher.nil? then
      flash[:error] = t("errors.invalid_voucher")
      redirect_to new_point_path
    else
      @voucher.redeem(current_user)
      respond_with(@voucher)
    end
  end

private
  def voucher_params
    params.require(:voucher).permit(:code)
  end
end
