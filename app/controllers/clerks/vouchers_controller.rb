class Clerks::VouchersController < ApplicationController
  before_action :authenticate_clerk!

  before_action :set_voucher, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @vouchers = current_clerk.vouchers.all
    respond_with(@vouchers)
  end

  def show
    respond_with(@voucher)
  end

  def new
    @voucher = Voucher.new
    respond_with(@batch)
  end

  def create
    @voucher = Voucher.new(voucher_params)
    @voucher.company = current_clerk.company
    @voucher.expiration = 60.days.from_now
    @voucher.clerk = current_clerk
    @voucher.redeemed = false
    @voucher.points = (current_clerk.company.ratio * @voucher.monetary_value).to_i
    @voucher.save
    respond_with(@voucher, location: clerks_vouchers_path)
  end

  def destroy
    @voucher.destroy
    respond_with(@batch, location: clerks_vouchers_path)
  end

  private
    def set_voucher
      @voucher = Voucher.find(params[:id])
    end

    def voucher_params
      params.require(:voucher).permit(:monetary_value)
    end
end
