# Controller for handling authentication requests.
# Provides actions for user login and potentially other authentication-related processes.
class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  # POST /auth/login
  def login
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      token = encode(user_id: @user.id)
      render json: { token: }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
end
