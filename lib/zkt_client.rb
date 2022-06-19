# frozen_string_literal: true

require 'forwardable'
require_relative 'zkt_client/version'
require_relative 'zkt_client/monkey_patchers'
require_relative 'zkt_client/models/record'
require_relative 'zkt_client/models/area'
require_relative 'zkt_client/configuration'
require_relative 'zkt_client/constants/path'
require_relative 'zkt_client/models/terminal'
require_relative 'zkt_client/models/position'
require_relative 'zkt_client/models/employee'
require_relative 'zkt_client/models/department'
require_relative 'zkt_client/models/transaction'

module ZktClient
  include ZktClient::Models
  include ZktClient::Constants

  class << self
    extend Forwardable

    def_delegators(:configuration, *ZktClient::Configuration.instance_methods(false))

    def configuration
      Configuration.instance
    end

    def configure
      yield(configuration)
    end
  end
end
