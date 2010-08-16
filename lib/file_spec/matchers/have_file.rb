module RSpec::FileMatchers
  class HaveFile < HaveFileItem
    
    def artifact
      'file'
    end
  end

  def have_file(*args)
    HaveFile.new(args)
  end
  alias_method :contain_file, :have_file
end
    
module RSpec::FileMatchers
  class HaveFiles < HaveFileItems
    
    def artifact
      'file'
    end
  end

  def have_files(*args)
    HaveFiles.new(args)
  end
  alias_method :contain_files, :have_files
end


