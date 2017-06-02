class Trie
  def initialize
    @root = Node.new(nil)
  end

  def insert(word)
    current_node = @root
    word.chars.each do |char|
      child_node = current_node.get_child(char)
      if child_node
        current_node = child_node
      else
        new_node = Node.new(char)
        current_node.children << new_node
        current_node = new_node
      end
    end
    current_node.complete_word = true
  end

  def include?(word)

  end
end

class Node
  attr_accessor :letter, :complete_word, :children

  def initialize(letter)
    @letter = letter
    @complete_word = false
    @children = []
  end

  def get_child(char)
    @children.each do |child|
      return child if child.letter == char
    end
    nil
  end
end


if __FILE__ == $PROGRAM_NAME
  my_trie = Trie.new
  File.read_lines("./dictionary.txt").each do |word|
    my_trie.insert(word.chomp)
  end
end
