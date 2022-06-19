# frozen_string_literal: true

require 'faraday'
require 'faraday/net_http'
require_relative 'token_generator'

module ZktClient
  class HttpClient
    class << self
      def get(url, params = {})
        do_request(method: :get, url: url, params: params)
      end

      def post(url, params = {})
        do_request(method: :post, url: url, body: params)
      end

      def put(url, params = {})
        do_request(method: :put, url: url, body: params)
      end

      def delete(url)
        do_request(method: :delete, url: url)
      end

      def do_request(method:, url:, params: {}, body: {})
        connection = Faraday.new(
          url: url,
          params: params,
          headers: {
            'Content-Type' => 'application/json',
            'Authorization' => token
          }
        )

        response = connection.send(method) do |req|
          req.body = body.to_json
        end

        body = response.body

        JSON.parse(body) unless body.empty?
      end

      def token
        TokenGenerator.instance.call
      end
    end

    private_class_method :do_request, :token
  end
end
