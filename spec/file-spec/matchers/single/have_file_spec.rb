require 'spec_helper'

module RSpec::FileMatchers
  describe HaveFile do
    describe '#have_file' do
      include FileHelper

      before :each do
        remove_all_test
      end

      after :each do
        remove_test_file
      end

      it "should have file" do
        nil.should_not have_file test_file
      end

      it "should have file" do
        make_test_file
        nil.should have_file test_file
      end
    end
  end
end
