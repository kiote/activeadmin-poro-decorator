module ActiveAdmin
  class Comment < ActiveRecord::Base
    # @return [String] The name of the record to use for the polymorphic relationship
    def self.resource_type(resource)
      # original method has 
      # ResourceController::Decorators.undecorate(resource).class.base_class.name.to_s
      # here, but somehow it didn't work
      undecorated = ResourceController::Decorators.undecorate(resource)
      if undecorated.to_s.include?(':')
        undecorated = undecorated.class.to_s
      end
      undecorated.to_s
    end
  end
end