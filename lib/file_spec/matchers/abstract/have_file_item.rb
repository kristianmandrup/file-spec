module RSpec::FileMatchers
  class HaveFileItem         
    attr_accessor :location

    def initialize(*args)
      self.location = get_location(args).to_s
    end

    def get_location(*args)
      args = args.flatten
      loc = if args.size > 1
        dir, name = *args
        File.join(dir.to_s, name.to_s)
      else
        args[0].to_s
      end
    end

    def matches? x=nil, &block
      puts location.inspect
      match = File.send :"#{artifact}?", location
      yield if block && match
      match
    end          

    def artifact
      raise "artifact method must be overridden by subclass"
    end
  
    def failure_message
      "Expected #{artifact} at: #{location} to exist, but it did not"
    end

    def negative_failure_message
      "Did not expected #{artifact} at: #{location} to exist, but it did"
    end    
  end

  def have_file(*args)
    HaveFile.new(args)
  end
  alias_method :contain_file, :have_file
end

