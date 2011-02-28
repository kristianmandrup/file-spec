module RSpec::FileMatchers
  class HaveFileItem         
    attr_accessor :location, :symlink_type

    def initialize(*args)
      self.location = get_location(args).to_s
    end

    def get_location(*args)
      args = args.flatten

      case args.last
      when Hash
        self.symlink_type = args.last[:type]
      end
      
      loc = if args.size > 1
        dir, name = *args
        dir = dir.kind_of?(Dir) ? dir.path : dir
        name = name.kind_of?(File) ? name.path : name        
        File.join(dir.to_s, name.to_s)
      else
        args[0].to_s
      end
    end

    def matches? relative_path, &block
      case relative_path
      when File
        @location = relative_path if !@location
        Dir.chdir File.dirname(location)
      when Dir  
        @location = relative_path if !@location
        Dir.chdir location
      when String                        
        if File.exist?(relative_path)      
          @location = relative_path if !@location
          Dir.chdir File.dirname(location) 
        end
      end      

      match = File.send :"#{artifact}?", location
      if artifact == :symlink
        case symlink_type
        when :dir, :directory
          match = File.readlink(location).directory?
        when :file
          match = File.readlink(location).file?
        else
          raise ArgumentError, "Bad symlink type #{symlink_type}, must be either :file or :dir" if symlink_type
        end
      end
            
      if block && match   
        case artifact
        when :directory
          dir = location # Dir.new(location).path
          Dir.chdir location do
            yield dir
          end
        when :file        
          yield File.new(location)          
        end      
      end
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

