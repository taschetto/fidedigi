class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_user_type

  private
    def layout_by_user_type
      return "layouts/application" if user_signed_in?
      return "layouts/managers/application" if manager_signed_in?
      "devise"
    end
end
