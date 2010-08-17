module FileHelper
  module TestSymlinks
    module Files
      module Names
        def sym_test_file
          "sym-#{test_file}"
        end

        def sym_test_file2
          "sym-#{test_file2}"
        end

        def sym_test_files
          [sym_test_file, sym_test_file2]
        end               
      end
      
      module Make
        def make_file_symlink orig_file, sym_file
          make_file orig_file if !File.file?(orig_file)
          File.symlink(orig_file, sym_file) if !File.symlink?(sym_file)
        end

        def make_test_symlink_file  
          make_file_symlink test_file, sym_test_file
        end

        def make_test_symlink_files
          test_files.each_with_index{|file, i| make_file_symlink(file, sym_test_files[i])}
        end
      end
      
      module Remove
        def remove_symlink_file path
          File.delete path if File.symlink? path
        end

        def remove_test_symlink_file
          remove_symlink_file sym_test_file
        end

        def remove_test_symlink_files
          sym_test_files.each{|f| remove_symlink_file f} 
        end
      end 
      
      include Names
      include Make
      include Remove      
    end
    
    module Dirs
      module Names
        def sym_test_dir
          'sym-test-dir'
        end

        def sym_test_dir2
          "#{sym_test_dir}2"
        end

        def sym_test_dirs
          [sym_test_dir, sym_test_dir2]
        end        
      end
      
      module Make
        def make_dir_symlink orig_dir, sym_dir
          make_dir orig_dir if !File.directory?(orig_dir)
          File.symlink(orig_dir, sym_dir) if !File.symlink?(sym_dir)
        end

        def make_test_symlink_dir             
          make_dir_symlink test_dir, sym_test_dir    
        end

        def make_test_symlink_dirs
          test_dirs.each_with_index{|file, i| make_dir_symlink(file, sym_test_dirs[i])}
        end        
      end
      
      module Remove
        def remove_symlink_dir path
          File.delete path if File.symlink? path
        end
        
        def remove_test_symlink_dir
          remove_symlink_dir sym_test_dir
        end

        def remove_test_symlink_dirs
          sym_test_dirs.each{|dir| remove_symlink_dir dir}
        end        
      end
      
      include Names
      include Make
      include Remove
    end
    
    include Dirs
    include Files 
  end
  
  include TestSymlinks
end
