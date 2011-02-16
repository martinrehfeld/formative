# encoding: utf-8

require 'rubygems'
require 'bundler'
Bundler.setup

require 'action_view'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'formative'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
end

module FormativeSpecHelper

  def mock_template
    t = Object.new

    class << t
      include ActionView::Helpers
    end

    t
  end

end

::ActiveSupport::Deprecation.silenced = false
