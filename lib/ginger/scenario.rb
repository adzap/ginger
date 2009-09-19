module Ginger
  class Scenario < Hash
    attr_reader :name, :options

    def initialize(*name_and_options)
      if name_and_options.first.is_a?(String)
        @name = name_and_options.shift
        @options = name_and_options.pop || {}
      elsif name_and_options.first.is_a?(Hash)
        @options = name_and_options.pop
      else
        @options = {}
      end
    end

    def add(gem, version)
      self[gem] = version
    end
    
    def version(gem)
      self.keys.each do |key|
        case key
        when String
          return self[key] if gem == key
        when Regexp
          return self[key] if gem =~ key
        end
      end
      
      return nil
    end
    
    def gems
      self.keys
    end

    def ruby_versions
      @options[:ruby_versions] || []
    end
  end
end
