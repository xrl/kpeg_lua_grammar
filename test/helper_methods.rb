require 'lupin'

module TestHelperMethods
  def parse (input, rule)
    parser = Lupin::Parser.new(input)
    raise parser.failure_info unless parser.parse(rule.to_s)
  end
end
