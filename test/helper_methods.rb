require 'lupin'

module TestHelperMethods
  def parses_to_result(input,rule)
    parser = Lupin::Parser.new(input)
    assert(parser.parse(rule.to_s), parser.failure_info)
  end
  
  def doesnt_parse_to_result(input,rule)
    parser = Lupin::Parser.new(input)
    assert(!parser.parse(rule.to_s))
  end
end
