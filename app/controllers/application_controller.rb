# frozen_string_literal: true

# application_controller.rb
class ApplicationController < ActionController::Base
  helper_method :current_user, :unauthorized?

  def current_user
    return nil unless session[:user_id]

    @current_user ||= User.find(session[:user_id])
  end

  def unauthorized?
    current_user.nil?
  end

  def require_user
    return unless unauthorized?

    flash[:notice] = 'Please log in first...'
    redirect_to login_path
  end
end
