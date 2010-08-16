module RSpec::FileMatchers
  class HaveSymlink < HaveFileItem

    def artifact
      'symlink'
    end    
  end

  def have_symlink(*args)
    HaveSymlink.new(args)
  end
  alias_method :contain_symlink, :have_symlink
  
  alias_method :contain_symlink_file, :have_symlink
  alias_method :have_symlink_file, :have_symlink
  
  alias_method :contain_symlink_dir, :have_symlink
  alias_method :have_symlink_dir, :have_symlink  
end

module RSpec::FileMatchers
  class HaveSymlinks < HaveFileItems

    def artifact
      'symlink'
    end    
  end

  def have_symlinks(*args)
    HaveSymlinks.new(args)
  end
  alias_method :contain_symlinks, :have_symlinks

  # TODO
  alias_method :contain_symlink_files, :have_symlinks
  alias_method :have_symlink_files, :have_symlinks
  
  alias_method :contain_symlink_dirs, :have_symlinks  
  alias_method :have_symlink_dirs, :have_symlinks
end

