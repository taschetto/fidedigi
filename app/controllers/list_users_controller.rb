class ListUsersController < ApplicationController
  layout "devise"
  def index
    @users = User.all
    @clerks = Clerk.all
    @managers = Manager.all
  end
end
