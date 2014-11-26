require 'yaml'

module ActiveadminPoroDecorator
  module Config
    class Reader
      def initialize
        @config = YAML.load_file('config/activeadmin-poro-decorator.yml')
      end

      def param(name)
        @config[name]
      end
    end
  end
end