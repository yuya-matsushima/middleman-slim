ENV["TEST"] = "true"
ENV["AUTOLOAD_SPROCKETS"] = "false"

require 'simplecov'
SimpleCov.root(File.expand_path(File.dirname(__FILE__) + '/../..'))

require 'middleman-core'
require 'middleman-core/step_definitions'
