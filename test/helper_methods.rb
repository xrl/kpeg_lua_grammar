require 'lupin'

module TestHelperMethods
  def parse (rule, input, sexp)
    parser = Lupin::Parser.new(input)
    # Is the string at least partially acceptable?
    assert parser.parse(rule.to_s), "Could not apply #{rule.inspect} to `#{input}'"
    assert_equal sexp, parser.result
  end
  def no_parse(rule, input)
    parser = Lupin::Parser.new(input)
    assert_equal parser.parse(rule.to_s), false, "Should not parse `#{input}` with #{rule.inspect}"
  end
end
