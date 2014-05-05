module MiniLisp
  class Parser < Parslet::Parser
    rule(:space) { match('\s').repeat(1) }
    rule(:space?) { space.maybe }

    rule(:comma) { str(',') >> space? }
    rule(:lparen) { str('(') >> space? }
    rule(:rparen) { str(')') >> space? }

    rule(:integer) do
      match('[0-9]').repeat(1).as(:integer) >> space?
    end

    rule(:operator) do
      match('[+]') >> space?
    end

    rule(:sum) do
      integer.as(:left) >> operator.as(:op) >> expression.as(:right)
    end

    rule(:arglist) do
      expression >> (comma >> expression).repeat
    end

    rule(:identifier) do
      match['a-z'].repeat(1) >> space?
    end

    rule(:funcstart) do
      str('def') >> space? >> identifier >> lparen >> arglist.maybe >> rparen
    end

    rule(:func) do
      funcstart >> space? >> expressions >> str('end')
    end

    rule(:expression) do
      sum | identifier | integer | func
    end

    rule(:expressions) do
      space? >> expression.repeat
    end

    root :expressions
  end
end