require 'rspec'
require 'require_all'      
require 'fileutils'
require 'active_support/inflector'      

module RSpec
  module FileMatchers
  end
end

require_all File.dirname(__FILE__) + '/file_spec/matchers/abstract'
require_all File.dirname(__FILE__) + '/file_spec/matchers'

RSpec.configure do |config|
  config.include(RSpec::FileMatchers)  
end
