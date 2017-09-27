class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :authenticate_user!

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    error = "Unauthorized to perform this action"
    redirect_to root_path, flash: {error: error}
  end
end
