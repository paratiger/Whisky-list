ENV["RAILS_ENV"] = "test"
require File.expand_path( File.join(File.dirname(__FILE__), "..", "config", "environment" ))

# Load test helper
##############################################################################
require 'rails/test_help'

# Load Shoulda macros
############################################################################## 
require "test/shoulda/custom_matchers"

include Shoulda::CustomMatchers 
extend Shoulda::CustomMatchers