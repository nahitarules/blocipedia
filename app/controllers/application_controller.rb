class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:warning]  = "You are not authorized"
    redirect_to wikis_path
  end
end
