class PhoneTrie
  attr_accessor :root

  LETTERS_TO_NUMS = {
    "a" => 2,
    "b" => 2,
    "c" => 2,
    "d" => 3,
    "e" => 3,
    "f" => 3,
    "g" => 4,
    "h" => 4,
    "i" => 4,
    "j" => 5,
    "k" => 5,
    "l" => 5,
    "m" => 6,
    "n" => 6,
    "o" => 6,
    "p" => 7,
    "q" => 7,
    "r" => 7,
    "s" => 7,
    "t" => 8,
    "u" => 8,
    "v" => 8,
    "w" => 9,
    "x" => 9,
    "y" => 9,
    "z" => 9
  }

  def initialize
    @root = Node.new(nil)
  end

  def insert(word)
    current_node = @root
    word.chars.each do |char|
      num = LETTERS_TO_NUMS[char]
      child_node = current_node.get_child(num)
      if child_node
        current_node = child_node
      else
        new_node = Node.new(num)
        current_node.children << new_node
        current_node = new_node
      end
    end
    current_node.words << word
  end

  def include?(word)
    current_node = @root
    word.chars.each do |char|
      num = LETTERS_TO_NUMS[char]
      child_node = current_node.get_child(num)
      if child_node
        current_node = child_node
      else
        return false
      end
    end
    current_node.words.include?(word)
  end
end

class Node
  attr_accessor :num, :words, :children

  def initialize(num)
    @num = num
    @words = []
    @children = []
  end

  def get_child(num)
    @children.each do |child|
      return child if child.num == num
    end
    nil
  end
end

if __FILE__ == $PROGRAM_NAME
  phone_trie = PhoneTrie.new
  File.readlines("./dictionary.txt").each do |word|
    phone_trie.insert(word.chomp)
  end

  p phone_trie.root.children.length == 8
  p phone_trie.include?("cat")
end
