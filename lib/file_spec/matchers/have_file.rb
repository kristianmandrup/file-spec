module RSpec::FileMatchers
  class HaveFile < Abstract
    
    def artifact
      'file'
    end
  end

  def have_file(*args)
    HaveFile.new(args)
  end
  alias_method :contain_file, :have_file
end

