module RSpec::FileMatchers
  class HaveFileItems
    attr_accessor :file_items

    def initialize(*file_items)
      self.file_items = file_items.flatten
    end

    def matches? x=nil, &block
      file_item_names.each do |location|       
        return false if  !File.send(:"#{artifact}?", location)
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
      "Expected #{artifact.pluralize} [#{file_item_names}] to exist, but they did not"
    end

    def negative_failure_message
      return "Did not expect #{artifact} #{file_item_names.first} to exist, but it did" if file_items.size == 1
      "Did not expect #{artifact.pluralize} [#{file_item_names}] to exist, but they did"
    end    
  end

  def have_file_items(*args)
    HaveFileItems.new(args)
  end
end

