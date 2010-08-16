module FileHelper
  def test_file
    'test.txt'
  end

  def sym_test_file
    'sym-test.txt'
  end

  def test_dir
    'test'
  end

  def sym_test_dir
    'sym-test'
  end

  def remove_all_test
    remove_test_file
    remove_test_dir
    remove_symlink_file
    remove_symlink_dir
  end
    
  def make_test_file
    File.open(test_file, 'w') {|f| f.write "hello" }
  end

  def remove_test_file
    ::FileUtils.rm_f test_file
  end

  def make_test_dir
    ::FileUtils.mkdir test_dir
  end

  def remove_test_dir
    ::FileUtils.rm_rf test_dir
  end

  def make_symlink_file  
    make_test_file if !File.file?(test_file)
    File.symlink(test_file, sym_test_file) if !File.symlink?(sym_test_file)
  end

  def remove_symlink_file
    ::FileUtils.rm_f sym_test_file
  end

  def make_symlink_dir
    make_test_dir if !File.directory?(test_dir)
    File.symlink(test_dir, sym_test_dir) if !File.symlink?(sym_test_dir)
  end

  def remove_symlink_dir
    ::FileUtils.rm_rf sym_test_dir
  end
end
