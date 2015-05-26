class PointsController < ApplicationController
  layout "layouts/application"
  before_action :authenticate_user!
  before_action :set_user, only: [:index, :show]
  before_action :set_company, only: [:show]

  respond_to :html, :json

  def index
    @points = @user.points_by_company
    respond_with(@points)
  end

  def show
    @points = @user.points.
                where("balance > 0").
                where(company: @company).
                order("expiration ASC")
    respond_with(@points)
  end

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

  def set_user
    @user = current_user
  end

  def set_company
    @company = Company.find(params[:company_id])
  end
end
