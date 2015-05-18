class Managers::CompaniesController < ApplicationController
  before_action :authenticate_manager!

  def show
  end
end
