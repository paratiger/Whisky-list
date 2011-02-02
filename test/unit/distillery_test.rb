require File.join(File.dirname(__FILE__), "..", "test_helper")

class DistilleryTest < ActiveSupport::TestCase
  # Metatests
  ############################################################################
  should be_valid_with_factory
  
  # Validations
  ############################################################################
  should validate_presence_of :title
  
  # Relationships
  ############################################################################
  should have_many :whiskies
  
  # Database tests
  ############################################################################
  should have_db_column(:title).of_type(:string)
  should have_db_column(:url).of_type(:string)
  should have_db_column(:lat).of_type(:float)
  should have_db_column(:lng).of_type(:float)
  should have_db_column(:created_at).of_type(:datetime)
  should have_db_column(:updated_at).of_type(:datetime)
  
  should have_db_index(:title)
end