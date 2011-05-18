require 'lupin'

module TestHelperMethods
  def parse (input, rule)
    parser = Lupin::Parser.new(input)
    # Is the string at least partially acceptable?
    raise parser.failure_info unless parser.parse(rule.to_s)
    # Is the string entirely acceptable?
    raise "Only parsed #{parser.pos} [#{input[0..parser.pos]}] of #{input.length} [#{input}] bytes" unless parser.pos == input.length
  end
end
