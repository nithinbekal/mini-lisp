require 'parslet'

module MiniLisp
  class Transform < Parslet::Transform
    rule(integer: simple(:value)) do
      IntegerNode.new(value)
    end

    rule(left: simple(:left), right: simple(:right), op: '+' ) do
      AddNode.new(left, right)
    end
  end
end
