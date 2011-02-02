class Distillery < ActiveRecord::Base

  # Model definition
  ############################################################################
  
  # Relationships
  has_many :whiskies
  
  # Validations
  validates :title, :presence => true
  
  # Attribute protection
  attr_accessible :title, :lat, :lng, :url
  
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
