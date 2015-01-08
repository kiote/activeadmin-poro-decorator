module ActiveAdmin
  class Comment < ActiveRecord::Base
    # @returns [String] The name of the record to use for the polymorphic relationship
    def self.resource_type(resource)
      return resource.type if resource.respond_to?(:type)
      ResourceController::Decorators.undecorate(resource).class.name.to_s
    end
  end
end