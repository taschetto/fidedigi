class Users::SessionsController < Devise::SessionsController
  def create
    # Find the user type
    u = params[:user] ? params[:user] : params[:manager]
    user_class = :user
    if is_user?(u)
      user_class = :user
    elsif is_manager?(u)
      user_class = :manager
    end

    # Attempt authentication with Warden
    self.resource = warden.authenticate(scope: user_class)
    if self.resource.nil?
      # Authentication failed
      flash[:error] = "Invalid email or password."
      return redirect_to new_session_path(user_class)
    end

    # Successful authentication
    sign_in(user_class, self.resource)
    respond_with self.resource, :location => after_sign_in_path_for(self.resource)
  end

  def destroy
    sign_out(self.resource)
    redirect_to "/"
  end

  def new
    self.resource = User.new
  end

  private

  def is_manager?(user)
    a = Manager.find_by(email: user[:email])
    !a.nil?
  end

  def is_user?(user)
    u = User.find_by(email: user[:email])
    !u.nil?
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      super
    elsif resource.is_a?(Manager)
      return '/managers'
    end
  end
end