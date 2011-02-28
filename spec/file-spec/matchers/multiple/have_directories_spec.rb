require 'spec_helper'

module RSpec::FileMatchers
  describe HaveFiles do
    describe '#have_dirs' do
      include FileHelper
      
      before :each do   
        remove_all_test
      end

      after :each do
        remove_all_test
      end

      it "should not have 'test' dirs" do
        nil.should_not have_dirs test_dirs
      end
    
      it "should have 'test' dirs" do      
        make_test_dirs
        nil.should have_dirs test_dirs
      end

      it "should have 'test' dirs in the current dir" do      
        make_test_dirs
        Dir.pwd.should have_dirs test_dirs
      end

      it "should have 'test' dirs in the current Dir" do      
        make_test_dirs 
        dir = Dir.new(Dir.pwd)
        dir.should have_dirs test_dirs
      end
    end
  end
end