# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_error
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized_error
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_establishment!

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: %i[trading_name]
    )
  end

  def not_found_error
    redirect_to root_path
    flash[:error] = t('not_found')
  end

  def not_authorized_error
    redirect_to root_path
    flash[:error] = t('not_authorized')
  end

  def pundit_user
    current_establishment
  end
end
