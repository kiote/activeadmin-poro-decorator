require 'yaml'

module ActiveadminPoroDecorator
  module Config
    class Reader
      def initialize
        @config = YAML.load_file('activeadmin-poro-decorator.yml.example')
      end
    end

    def read(option)
      @config[option]
    end
  end
end