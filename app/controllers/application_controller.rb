class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user, :user_role
  include Devise::Controllers::Helpers
  include Devise::Controllers::SignInOut
  protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  # end

  private

  def current_user
    # your code to get the current user
  end

  def user_role
    if current_user
      current_user.role.downcase.to_sym # replace this with your logic to get the user's role
    else
      :guest
    end
  end
end
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

def create
  # puts "Parameters: #{params.inspect}"
end

 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :role])
  end

  private

  def user_role
    if current_user
      current_user.role.downcase.to_sym # replace this with your logic to get the user's role
    else
      :guest
    end
  end
end
