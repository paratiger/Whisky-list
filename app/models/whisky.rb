class Whisky < ActiveRecord::Base

  # Model definition
  ############################################################################
  
  # Relationships
  belongs_to :distillery
  
  # Validations
  validates :title, :presence => true
  validates :distillery, :presence => true
  
  # Attribute protection
  attr_accessible :title, :body, :rating, :image_url, :url, :distillery_id
  
  # Class methods
  ############################################################################
  
  class << self
  end
  
  # Instance methods
  ############################################################################
  
  # Private methods
  ############################################################################
  
  private
  
end
