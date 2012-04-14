require 'lupin'
require 'debugger'
module MiniTest
  module Assertions
    def parse (rule, input, sexp)
      parser = Lupin::Parser.new(input)
      # Is the string at least partially acceptable?
      assert parser.parse(rule.to_s),        "Could not apply #{rule.inspect} to `#{input}'. Expected #{parser.failure_info}"
      assert_equal input.length, parser.pos, "The rule #{rule.inspect} could not consume all of `#{input}`. Got `#{parser.result.inspect}`"
      assert_equal sexp, parser.result
    end
    def no_parse(rule, input)
      parser = Lupin::Parser.new(input)
      assert_equal parser.pos, 0, "Should not parse `#{input}` with #{rule.inspect}. Parser returned `#{parser.result.inspect}`"
    end
  end
end