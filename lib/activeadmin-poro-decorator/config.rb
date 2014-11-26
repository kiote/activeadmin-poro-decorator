require 'yaml'

module ActiveadminPoroDecorator
  module Config
    class Reader
      def initialize
        @config = YAML.load_file('activeadmin-poro-decorator.yml')
      end
    end
  end
end