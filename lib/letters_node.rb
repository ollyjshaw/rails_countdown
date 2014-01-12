module MyMod
  class LettersNode
    attr_accessor :charachter, :children, :is_word

    def self.new_root
      LettersNode.new(nil)
    end

    def initialize(charachter, children=[])
      @charachter = charachter
      @children = children
      @is_word = false
    end

    def has_child (char)
      @children.select { |node| node.charachter==char }.size>0
    end

    def get_child (char)
      @children.select{|node| node.charachter==char}.first
    end

    def new_or_existing_child(char)
      found_node = @children.select { |node| node.charachter==char }.first
      if found_node
        found_node
      else
        new_child = LettersNode.new(char)
        self.children << new_child
        new_child
      end
    end
  end
end
