require 'yaml'

module ActiveadminPoroDecorator
  module Config
    class Reader
      def initialize
        @config = if ENV['RAILS_ENV'] == 'test'
          YAML.load_file('spec/support/dummy/config/activeadmin-poro-decorator.yml')
        else
          YAML.load_file('config/activeadmin-poro-decorator.yml')
        end
      end

      def param(name)
        @config[name]
      end
    end
  end
end