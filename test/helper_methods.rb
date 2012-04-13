require 'lupin'

module TestHelperMethods
  def parse (rule, input, sexp)
    parser = Lupin::Parser.new(input)
    # Is the string at least partially acceptable?
    assert parser.parse(rule.to_s), "Could not apply #{rule.inspect} to `#{input}'"
    if sexp != parser.result
      raise RuntimeError, "Expected #{sexp.inspect} but got #{parser.result.inspect}"
    end
  end
end
