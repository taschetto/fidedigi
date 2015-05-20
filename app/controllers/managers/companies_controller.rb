class Managers::CompaniesController < ApplicationController
  layout "layouts/managers/application"
  before_action :authenticate_manager!

  def show
  end
end
