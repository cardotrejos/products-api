# frozen_string_literal: true

require 'jwt'

# Provides JWT encoding and decoding functionality to support secure user authentication.
# Utilizes the Rails application's secret key base and the HS256 algorithm for token operations.
module JsonWebToken
  extend ActiveSupport::Concern
  SECRET_KEY = Rails.application.secret_key_base
  ALGORITHM = 'HS256'

  def encode(payload, exp = 7.days.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY, ALGORITHM)
  end

  def decode(token)
    decoded = JWT.decode(token, SECRET_KEY, true, { algorithm: ALGORITHM })
    HashWithIndifferentAccess.new decoded[0]
  end
end
