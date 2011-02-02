module Shoulda
  module CustomMatchers
    
    def validate_email( attr )
      ValidateEmailMatcher.new( attr )
    end
    
    class ValidateEmailMatcher < Shoulda::ActiveRecord::Matchers::ValidationMatcher
      
      def initialize(attribute)
        super
      end

      def with_message(message)
        @expected_message = message if message
        self
      end

      def matches?(subject)
        super(subject)
        @expected_message ||= :invalid
        
        allows_value_of("test@example.com", @expected_message)
        allows_value_of("text@example.co.uk", @expected_message)
        allows_value_of("test@example.tv", @expected_message)
        allows_value_of("!#\$%&'*+-/=?^_\`\{|\}~@example.com", @expected_message)
        
        disallows_value_of("notanemail", @expected_message)
        disallows_value_of("not@example", @expected_message)
        disallows_value_of("@example.com", @expected_message)
        
      end

      def description
        "#{@attribute} be a valid email address"
      end
        
    end
    
  end
  
end
