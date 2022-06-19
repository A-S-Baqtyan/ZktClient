module ZktClient
  module BaseExtentions
    def blank?
      case self.class.name
      when 'String'
        strip.empty?
      when 'Array', 'Hash'
        empty?
      when 'FalseClass', 'NilClass'
        true
      when 'TrueClass'
        false
      end
    end

    def present?
      !blank?
    end
  end

  module StringExtentions
    include ZktClient::BaseExtentions
  end

  module NilExtentions
    include ZktClient::BaseExtentions
  end

  module ArrayExtentions
    include ZktClient::BaseExtentions
  end

  module FalseClassExtentions
    include ZktClient::BaseExtentions
  end

  module TrueClassExtentions
    include ZktClient::BaseExtentions
  end

  module HashExtentions
    include ZktClient::BaseExtentions
  end
end

class String
  include ZktClient::StringExtentions
end

class NilClass
  include ZktClient::NilExtentions
end

class Array
  include ZktClient::ArrayExtentions
end

class FalseClass
  include ZktClient::FalseClassExtentions
end

class TrueClass
  include ZktClient::TrueClassExtentions
end

class Hash
  include ZktClient::HashExtentions
end
