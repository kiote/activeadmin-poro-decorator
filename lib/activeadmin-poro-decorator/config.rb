require 'yaml'

module Poroaa
  module Config
    class Reader
      def initialize
        @config = YAML.load_file('activeadmin-poro-decorator.yml')
      end
    end

    def read(option)
      @config[option]
    end
  end
end