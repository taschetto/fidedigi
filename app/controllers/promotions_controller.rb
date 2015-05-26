class PromotionsController < ApplicationController
  layout "layouts/application"
  before_action :authenticate_user!

  before_action :set_company, only: [:index]
  before_action :set_promotion, only: [:show, :buy]

  respond_to :html, :json

  def all
    @promotions = Promotion.all
    respond_with(@promotions)
  end

  def index
    @promotions = @company.promotions.all
    respond_with(@promotions)
  end

  def buy
    @coupon = Coupon.new
    @coupon.promotion = @promotion
    @coupon.user = current_user
    @coupon.redeemed = false
    @coupon.save
    if @coupon.errors.any?
      flash[:error] = @coupon.errors.full_messages.to_sentence
      redirect_to @promotion
    else
      respond_with(@coupon)
    end
  end

  def show
    respond_with(@promotion)
  end

  private
    def set_company
      @company = Company.find(params[:company_id])
    end

    def set_promotion
      @promotion = Promotion.find(params[:id])
    end
end
