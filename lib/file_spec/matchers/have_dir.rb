module RSpec::FileMatchers
  class HaveDir < HaveFileItem

    def artifact
      :directory
    end  
  end

  def have_dir(dir)
    HaveDir.new(dir)
  end
end

module RSpec::FileMatchers
  class HaveDirs < HaveFileItems

    def artifact
      :directory
    end  
  end

  def have_dirs(*dirs)
    HaveDirs.new(dirs)
  end
end

