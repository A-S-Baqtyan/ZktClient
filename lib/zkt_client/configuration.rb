# frozen_string_literal: true

require 'singleton'

module ZktClient
  class Configuration
    include Singleton

    attr_writer :host, :username, :password, :auth_type

    def host
      @host || ENV['ZKT_HOST'] || ''
    end

    def username
      @username || ENV['ZKT_USERNAME'] || ''
    end

    def password
      @password || ENV['ZKT_PASSWORD'] || ''
    end

    def auth_type
      # general_auth or jwt_auth
      @auth_type || :general_auth
    end

    def credentials_missing?
      [host, username, password].any?(&:blank?)
    end
  end
end
