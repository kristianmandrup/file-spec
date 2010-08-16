module FileHelper
  def test_file
    'test.txt'
  end

  def test_files
    [test_file, 'test2.txt'] 
  end

  def sym_test_file
    'sym-test.txt'
  end

  def sym_test_files
    test_files.map{|f| "sym-#{f}" }
  end

  def test_dir
    'test'
  end

  def test_dirs
    [test_dir, 'test2']
  end

  def sym_test_dir
    'sym-test'
  end

  def sym_test_dirs
    [sym_test_dir, 'sym-test2']
  end

  def remove_all_test
    remove_test_files
    remove_test_dirs
    remove_test_symlinks
    remove_test_symlink_dirs
  end
    
  def make_test_file 
    make_file test_file
  end

  def make_test_files
    test_files.each{|f| make_file f}    
  end
  
  def make_file file
    File.open(file, 'w') {|f| f.write "hello" }    
  end

  def remove_file file
    ::FileUtils.rm_f file
  end

  def remove_test_file
    remove_file test_file
  end

  def remove_test_files
    test_files.each{|f| remove_file f}    
  end

  def make_dir dir
    ::FileUtils.mkdir dir
  end

  def make_test_dir
    make_dir test_dir
  end

  def make_test_dirs
    test_dirs.each{|dir| make_dir dir}
  end

  def remove_dir dir
    ::FileUtils.rm_rf dir
  end

  def remove_test_dir
    remove_dir test_dir
  end

  def remove_test_dirs
    test_dirs.each{|dir| remove_dir dir}
  end

  def make_file_symlink orig_file, sym_file
    make_file orig_file if !File.file?(orig_file)
    File.symlink(orig_file, sym_file) if !File.symlink?(sym_file)
  end

  def make_test_symlink  
    make_file_symlink test_file, sym_test_file
  end

  def make_test_symlinks
    test_files.each_with_index{|file, i| make_file_symlink(file, sym_test_files[i])}
  end

  def remove_test_symlink
    remove_file sym_test_file
  end

  def remove_test_symlinks
    sym_test_files.each{|f| remove_file f} 
  end

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

  def remove_test_symlink_dir
    remove_dir sym_test_dir
  end
  
  def remove_test_symlink_dirs
    sym_test_dirs.each{|dir| remove_dir dir}
  end
  
end
