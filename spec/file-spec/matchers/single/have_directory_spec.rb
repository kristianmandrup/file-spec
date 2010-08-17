require 'spec_helper'

module RSpec::FileMatchers
  describe HaveDir do
    describe '#have_dir' do
      include FileHelper
    
      before :each do   
        remove_all_test
      end
  
      after :each do
        remove_all_test
      end
  
      it "should not have 'test' dir" do
        nil.should_not have_dir test_dir
      end
  
      it "should have 'test' dir" do      
        make_test_dir
        nil.should have_dir test_dir
      end
  
      it "should have 'test' dirs" do      
        make_test_dirs
        nil.should have_dirs test_dirs
      end
  
    end

    describe '#have_dir nested blocks' do
      include FileHelper
    
      before :each do   
        remove_all_test
      end

      after :each do
        remove_all_test
      end
  
      it "should have nested test dirs" do      
        make_nested_test_dirs       
        nil.should have_dir :test
        nil.should_not have_dir :test2
        nil.should have_dir test_dir do |dir|
          dir.should have_dirs test_dirs
          dir.should have_files test_files
        end      
        test_dir.should have_files test_files
      end
    end
  end
end