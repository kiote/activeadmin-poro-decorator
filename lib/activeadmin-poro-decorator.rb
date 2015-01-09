require 'activeadmin-poro-decorator/version'
require 'activeadmin-poro-decorator/config'
require 'activeadmin-poro-decorator/railtie' if defined?(Rails)

module ActiveadminPoroDecorator
  extend ActiveSupport::Concern

  def helpers
    ActionController::Base.helpers
  end

  included do
    delegate :url_helpers, to: "Rails.application.routes"
  end

  module ClassMethods
    def build_default_scope
      model_name.to_s.constantize.send(:build_default_scope)
    end

    def decorate(*args)
      collection_or_object = args[0]
      if collection_or_object.respond_to?(:to_ary)
        # assuming we have self.model_name method in decorator implementation
        # suggested by @eyefodder
        class_name = model_name.to_s.constantize
        DecoratedEnumerableProxy.new(collection_or_object, class_name)
      else
        new(collection_or_object)
      end
    end

    def helpers
      ActionController::Base.helpers
    end
  end

  class DecoratedEnumerableProxy < DelegateClass(ActiveRecord::Relation)
    include Enumerable

    delegate :as_json, :collect, :map, :each, :[], :all?, :include?, :first, :last, :shift, :to => :decorated_collection

    def initialize(collection, class_name)
      super(collection)
      @class_name = class_name
    end

    def klass
      config = Config::Reader.new
      "#{@class_name}#{config.param('modelname')}".constantize
    end

    def wrapped_collection
      __getobj__
    end

    def decorated_collection
      @decorated_collection ||= wrapped_collection.collect { |member| klass.decorate(member) }
    end
    alias_method :to_ary, :decorated_collection

    def each(&blk)
      to_ary.each(&blk)
    end
  end
end
