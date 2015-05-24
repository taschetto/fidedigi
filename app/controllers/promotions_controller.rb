class PromotionsController < ApplicationController
  layout "layouts/application"
  before_action :authenticate_user!

  before_action :set_company, only: [:index]
  before_action :set_promotion, only: [:show]

  respond_to :html, :json

  def all
    @promotions = Promotion.all
    respond_with(@promotions)
  end

  def index
    @promotions = @company.promotions.all
    respond_with(@promotions)
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
