# frozen_string_literal: true

require 'singleton'

module ZktClient
  class TokenGenerator
    include Singleton

    def call
      raise 'Credentials not confiured yes' if ZktClient.credentials_missing?

      token = response['token']

      raise 'Invalid credentials' if token.nil?

      "Token #{token}"
    end

    private

    def response
      connection = \
        Faraday.new(url: url, headers: { 'Content-Type' => 'application/json' })

      body = connection.post { |req| req.body = params.to_json }.body

      JSON.parse(body)
    end

    def params
      {
        username: ZktClient.username,
        password: ZktClient.password
      }
    end

    def url
      ZktClient.host + path
    end

    def path
      if ZktClient.auth_type == :general_auth
        '/api-token-auth/'
      else
        '/jwt-api-token-auth/'
      end
    end
  end
end
