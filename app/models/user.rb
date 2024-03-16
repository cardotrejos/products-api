# frozen_string_literal: true

# Passwords are securely hashed and stored using has_secure_password.
class User < ApplicationRecord
  require "securerandom"

  has_secure_password

  validates :username, presence: true
  validates :password, presence: true
end
