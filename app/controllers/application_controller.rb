# frozen_string_literal: true

# Base controller for the application.
# Includes common functionalities for other controllers, such as authentication handling.
class ApplicationController < ActionController::API
  include JsonWebToken

  before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = decode(header)

    @current_user = User.find(decoded[:user_id])
  end
end
