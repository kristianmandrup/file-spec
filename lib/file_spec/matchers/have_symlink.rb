module RSpec::FileMatchers
  class HaveSymlink < Abstract

    def artifact
      'symlink'
    end    
  end

  def have_symlink(*args)
    HaveSymlink.new(args)
  end
  alias_method :contain_symlink, :have_symlink
end

