require 'lupin'

module TestHelperMethods
  def parse (input, rule)
    parser = Lupin::Parser.new(input)
    # Is the string at least partially acceptable?
    raise parser.failure_info unless parser.parse(rule.to_s)
    # Is the string entirely acceptable?
    raise parser.failure_info unless parser.pos == input.length
  end
end
