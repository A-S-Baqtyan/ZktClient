# frozen_string_literal: true

module ZktClient
  module Models
    module Concerns
      module ClassMethods
        def find_by_id(id)
          find(id)
        rescue StandardError
          nil
        end

        def find(id)
          get_resource(id)

          raise("Couldn't find object with 'id'=#{id}") if @resource["id"].nil?

          new(@resource)
        end

        def all
          @collection = HttpClient.get(url)['data']

          initialize_objectes
        end

        def where(**options)
          @collection = HttpClient.get(url, options)['data']

          initialize_objectes
        end

        def create(**attributes)
          resource = HttpClient.post(url, attributes)

          if resource['id']
            new(resource)
          else
            resource
          end
        end

        def delete(id)
          get_resource(id)

          raise("Couldn't find object with 'id'=#{id}") if @resource["id"].nil?

          HttpClient.delete(url(id))

          new(@resource)
        end

        private

        def initialize_objectes
          @collection.map! do |hash|
            new(hash)
          end
        end

        def get_resource(id)
          @resource = HttpClient.get(url(id))
        end

        def url(id = nil)
          byebug
          ZktClient.host + ZktClient::PATH[name] + "#{id}/"
        end
      end
    end
  end
end
