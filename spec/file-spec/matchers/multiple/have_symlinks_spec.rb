require 'spec_helper'

module RSpec::FileMatchers
  describe HaveSymlinks do
    describe '#have_symlinks' do
      include FileHelper

      before :each do
        remove_all_test
      end

      after :each do
        remove_all_test
      end

      it "should not have symlink files" do
        nil.should_not have_symlinks sym_test_files
      end

      it "should have symlink files" do
        make_test_symlink_files
        nil.should have_symlinks sym_test_files
      end

      it "should not have symlink dirs" do
        nil.should_not have_symlink_dirs sym_test_dirs
      end

      it "should have symlink dirs" do
        make_test_symlink_dirs
        nil.should have_symlink_dirs sym_test_dirs
      end
    end
  end
end
