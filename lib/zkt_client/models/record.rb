# frozen_string_literal: true

require_relative 'concerns/class_methods'
require_relative 'concerns/instance_methods'
require_relative '../http_client'

module ZktClient
  module Models
    class Record
      include Concerns::InstanceMethods
      extend Concerns::ClassMethods

      def initialize(attributes = {})
        attributes.each_key do |key|
          self.class.send(:attr_reader, key)

          instance_variable_set("@#{key}", attributes[key])
        end
      end
    end
  end
end
