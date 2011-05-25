require 'lupin'

module TestHelperMethods
  def parse (rule, input, sexp)
    parser = Lupin::Parser.new(input)
    # Is the string at least partially acceptable?
    assert parser.parse(rule.to_s)
    raise RuntimeError, "Expected #{sexp} but got #{parser.result}" unless sexp == parser.result
  end
end
