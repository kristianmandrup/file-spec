module FileHelper
  module TestDirs
    module Names
      def test_dir
        'test'
      end

      def test_dir2
        'test2'
      end

      def test_dirs
        [test_dir, test_dir2]
      end
    end
    
    module Make
      def make_dir dir
        Dir.mkdir dir if !File.directory? dir
      end

      def make_test_dir
        make_dir test_dir
      end

      def make_test_dirs
        test_dirs.each{|dir| make_dir dir}
      end

      def make_nested_test_dirs
        make_test_dir
        FileUtils.chdir test_dir do          
          make_test_dirs        
          make_test_files
        end
      end
    end

    module Remove
      def remove_dir dir
        FileUtils.rm_rf dir if File.directory? dir
      end

      def remove_test_dir
        remove_dir test_dir
      end

      def remove_test_dirs
        test_dirs.each{|dir| remove_dir dir}
      end  
    end
    
    include Names
    include Make
    include Remove    
  end
  
  include TestDirs
end
