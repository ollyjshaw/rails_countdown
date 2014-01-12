require_relative '../lib/letters_node'
class LettersSolver
  def initialize
    @letter_tree_root = MyMod::LettersNode.new_root
    read_file
    organise_data
    @answers = SortedSet.new
  end

  def solve(letters)
    @answers = SortedSet.new
    recursive_solve('', letters, @letter_tree_root)
  end

  def connundrum
    @answers.each do |answer|
      if answer.length>7
        puts "Eight Letter Answer! #{answer}    "
        return answer
      end
    end
  end

  private
  def recursive_solve(prefix, letters, node)
    letters.chars.each_with_index do |char, index|
      before = letters[0, index]
      after = letters[index+1, letters.length]
      combined = before+after
      next_node = node.get_child(char)
      if   next_node
        recursive_solve(prefix+char, combined, next_node)
        if next_node.is_word
          @answers.add prefix+char
        end
      end
    end
  end

  def read_file
    file_name = '../2of12.txt'
    @dict = IO.readlines(file_name).map(&:chomp)
  end

  def organise_data
    @dict.each do |line|
      tree_position = @letter_tree_root
      clean_line = line.chomp
      clean_line.chars do |char|
        tree_position = tree_position.new_or_existing_child char
      end
      tree_position.is_word = true
    end
  end
end