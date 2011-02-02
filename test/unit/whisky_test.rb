require File.join(File.dirname(__FILE__), "..", "test_helper")

class WhiskyTest < ActiveSupport::TestCase
  # Metatests
  ############################################################################
  should be_valid_with_factory
  
  # Validations
  ############################################################################
  should validate_presence_of :title
  should validate_presence_of :distillery
  
  # Relationships
  ############################################################################
  should belong_to :distillery
  
  # Database tests
  ############################################################################
  should have_db_column(:title).of_type(:string).with_options(:null => false)
  should have_db_column(:body).of_type(:text)
  should have_db_column(:rating).of_type(:integer)
  should have_db_column(:image_url).of_type(:string)
  should have_db_column(:url).of_type(:string)
  should have_db_column(:distillery_id).of_type(:integer)
  should have_db_column(:created_at).of_type(:datetime)
  should have_db_column(:updated_at).of_type(:datetime)
  
  should have_db_index(:rating)
  should have_db_index(:distillery_id)
  
end
