
module MiniLisp
  class IntegerNode
    def initialize(value)
      @value = value
    end

    def eval
      @value.to_i
    end
  end

  class AddNode
    def initialize(left, right)
      @left, @right = left, right
    end

    def eval
      @left.eval + @right.eval
    end
  end
end