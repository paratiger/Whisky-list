source 'http://rubygems.org'

gem 'rails', '3.0.3'

# Essentials
gem 'sqlite3-ruby', :require => 'sqlite3'
gem "haml"
gem 'jquery-rails'
gem 'hpricot'

# Development
group :development do
  gem "mongrel"
  gem "cgi_multipart_eof_fix"
  gem "fastthread"
  gem "mongrel_experimental"
  gem "ruby-debug"
  gem "rails3-generators"
  gem "haml-rails"
end
  
# Testing
group :test do
  gem "autotest"
  gem "autotest-rails"
  gem "shoulda"
  gem "factory_girl_rails"
  gem "rcov"
  gem "rspec-rails", "2.0.0.beta.12"
  gem "rmagick"
  gem "memory_test_fix"
end

# Development database
group :development, :test do
  gem "metric_fu"
  gem "ruby-prof"
end
