module RSpec::FileMatchers
  class HaveSymlink < HaveFileItem

    def artifact
      :symlink
    end    
  end

  def have_symlink(*args)
    HaveSymlink.new(args)
  end
  alias_method :contain_symlink, :have_symlink

  def have_symlink_file(*args)
    have_symlink args, :type => :file
  end
  alias_method :contain_symlink_file, :have_symlink_file

  def have_symlink_dir(*args)
    have_symlink args, :type => :dir
  end
  alias_method :contain_symlink_dir, :have_symlink_dir

end

module RSpec::FileMatchers
  class HaveSymlinks < HaveFileItems

    def artifact
      :symlink
    end    
  end

  def have_symlinks(*args)
    HaveSymlinks.new(args)
  end
  alias_method :contain_symlinks, :have_symlinks

  def have_symlink_files(*args)
    have_symlinks args, :type => :file
  end
  alias_method :contain_symlink_files, :have_symlink_files

  def have_symlink_dirs(*args)
    have_symlinks args, :type => :dir
  end
  alias_method :contain_symlink_dirs, :have_symlink_dirs
end

