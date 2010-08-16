module RSpec::FileMatchers
  class HaveDir < Abstract

    def artifact
      'directory'
    end  
  end

  def have_dir(dir)
    HaveDir.new(dir)
  end

end

