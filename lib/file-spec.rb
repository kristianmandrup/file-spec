require 'rspec'
require 'require_all'
require 'fileutils'
require 'tmpdir'
require 'active_support/inflector'
require 'sugar-high'

module RSpec
  module FileMatchers
  end
end

require_all File.dirname(__FILE__) + '/file_spec/matchers/abstract'
require_all File.dirname(__FILE__) + '/file_spec/matchers'
require_all File.dirname(__FILE__) + '/file_spec/file_helpers'

RSpec.configure do |config|
  config.include(RSpec::FileMatchers)
end
