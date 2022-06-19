# frozen_string_literal: true

module ZktClient
  module Models
    module Concerns
      module InstanceMethods
        def update(attributes)
          resource = HttpClient.put(url, attributes)

          resource['id'] ? true : resource
        end

        def delete
          HttpClient.delete(url)

          true
        end

        private

        def url
          ZktClient.host + ZktClient::PATH[self.class.name] + "#{id}/"
        end
      end
    end
  end
end
