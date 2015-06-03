class DashboardController < ApplicationController
  layout "layouts/application"
  before_action :authenticate_user!, except: [:listusers]

  def index
    Access.inc
  end

  def listusers
  end
end
