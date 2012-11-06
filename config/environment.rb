# Load the rails application
require File.expand_path('../application', __FILE__)

EolUpgrade::Application.initialize!

# The order of environment loading is:
# 1) config/environment.rb
# 2) config/environments/#{Rails.env}.rb (THIS FILE)
# 3) config/environments/#{Rails.env}_eol_org.rb
override_environment_with_values_from(File.join(File.dirname(__FILE__), 'environments', "#{Rails.env}_eol_org"))
# 4) config/environment_eol_org.rb
override_environment_with_values_from(File.join(File.dirname(__FILE__), 'environment_eol_org'))
override_environment_with_values_from(File.join(File.dirname(__FILE__), 'environments', 'local'))
