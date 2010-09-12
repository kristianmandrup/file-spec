module FileHelper
  def remove_all_test
    remove_test_files
    remove_test_dirs        
    remove_test_symlink_files
    remove_test_symlink_dirs
  end  
  
  module TestFiles
    module Names
      def test_file
        'test.txt'
      end

      def test_file2
        'test2.txt'
      end

      def test_files
        [test_file, test_file2] 
      end
    end
  
    module Make    
      def make_test_file 
        make_file test_file
      end

      def make_test_files
        test_files.each{|f| make_file f}    
      end
  
      def make_file file
        File.open(file, 'w') {|f| f.write "hello" }
      end
    end
  
    module Remove
      def remove_file file
        File.delete file if File.exist? file
      end

      def remove_test_file
        remove_file test_file
      end

      def remove_test_files
        test_files.each{|f| remove_file f}    
      end
    end
    
    include Names
    include Make
    include Remove
  end
  
  include TestFiles
end
