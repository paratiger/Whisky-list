module Shoulda
  module CustomMatchers
    
    def be_valid_with_factory
      BeValidWithFactoryMatcher.new( self.name.gsub(/Test$/, '').underscore.to_sym )
    end
    
    class BeValidWithFactoryMatcher
      
      def initialize(class_name)
        @class_name = class_name
      end

      def matches?(subject)
        @instance = Factory.build( @class_name )
        @instance.valid?
      end

      def failure_message
        "Factory for #{@class_name} should have been valid, but was not"
      end

      def negative_failure_message
        "Factory for #{@class_name} should have been invalid, but was valid"
      end

      def description
        "should have a factory which generates a valid instance of #{@class_name}"
      end
        
    end
    
  end
end
