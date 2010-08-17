module RSpec::FileMatchers
  class HaveFileItems
    attr_accessor :file_items, :location

    def initialize(*file_items)
      self.file_items = file_items.flatten
    end

    def matches? relative_path=nil, &block
      case relative_path
      when File, Dir             
        full_path = File.expand_path(relative_path.path)
        @location = File.dirname(full_path) if !@location
      when String                        
        begin
          full_path = File.expand_path(relative_path)        
          if File.directory?(full_path)
            @location = full_path if !@location
          end
        rescue
          raise ArgumentError, "The path string #{relative_path} could not be resolved to an existing directory on this filesystem."
        end
      end      
      
      file_item_names.each do |loc|                  
        path = location ? File.join(location, loc) : loc
        return false if  !File.send(:"#{artifact}?", path)
      end
      true
    end          

    def file_item_names
      @file_item_names ||= file_items.map(&:to_s)
    end

    def artifact
      raise "artifact method must be overridden by subclass"
    end
  
    def failure_message                                                               
      return "Expected #{artifact} #{file_item_names.first} to exist, but it did not" if file_items.size == 1
      "Expected #{artifact.to_s.pluralize} #{file_item_names} to exist, but they did not"
    end

    def negative_failure_message
      return "Did not expect #{artifact} #{file_item_names.first} to exist, but it did" if file_items.size == 1
      "Did not expect #{artifact.to_s.pluralize} #{file_item_names} to exist, but they did"
    end    
  end

  def have_file_items(*args)
    HaveFileItems.new(args)
  end
end

