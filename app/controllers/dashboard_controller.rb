class DashboardController < ApplicationController
  layout "layouts/application"
  before_action :authenticate_user!

  def index
  end
end
