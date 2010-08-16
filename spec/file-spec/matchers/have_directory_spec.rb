require 'spec_helper'

module RSpec::FileMatchers
  describe HaveFile do
    describe '#have_dir' do
      include FileHelper
      
      before :each do   
        remove_test_dir
      end

      after :each do
        remove_test_dir
      end

      it "should have file" do
        nil.should_not have_dir test_dir
      end
    
      it "should have file" do      
        make_test_dir
        nil.should have_dir test_dir
      end
    end
  end
end