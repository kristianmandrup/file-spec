require 'spec_helper'

module RSpec::FileMatchers
  describe HaveSymlink do
    describe '#have_symlink' do
      include FileHelper
      
      before :each do   
        remove_all_test
      end

      after :each do
        remove_all_test
      end

      it "should not have symlink file" do
        nil.should_not have_symlink sym_test_file
      end

      it "should have symlink file" do
        make_test_symlink        
        nil.should have_symlink sym_test_file
      end
    
      it "should not have symlink dir" do
        nil.should_not have_symlink sym_test_dir
      end
      
      it "should have symlink dir" do      
        make_test_symlink_dir
        nil.should have_symlink sym_test_dir
      end
    end
  end
end