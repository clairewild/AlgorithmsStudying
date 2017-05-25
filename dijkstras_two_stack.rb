class Calculator
  def initialize
    @value_stack = []
    @opperator_stack = []
  end

  def evaluate(string)
    array = string.split(" ")
    opperators = ["+", "-", "*", "/"]

    array.each do |char|
      if opperators.include?(char)
        @opperator_stack << char
      elsif char == ")"
        self.compute
      else
        @value_stack << char.to_i
      end
    end

    self.compute until @value_stack.length == 1
    @value_stack.first
  end

  def compute
    val1 = @value_stack.pop
    val2 = @value_stack.pop
    opperand = @opperator_stack.pop

    case opperand
    when "+"
      @value_stack << val1 + val2
    when "-"
      @value_stack << val1 - val2
    when "*"
      @value_stack << val1 * val2
    when "/"
      @value_stack << val1 / val2
    end
  end
end
