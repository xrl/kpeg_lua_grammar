require "minitest/autorun"
require "test/helper_methods"

class ExpTest < MiniTest::Unit::TestCase
  def test_parse
    parse :exp, "nil", [:lit, nil]
    parse :exp, "false", [:lit, false]
    parse :exp, "true", [:lit, true]
    parse :exp, "1", [:number, 1.0]
    parse :exp, %Q{"kitties"}, [:string, "kitties"]
    parse :exp, "k()", [:functioncall, [:name,:k], []]
    # parse :exp, "(kitties())", [:functioncall, :kitties, []]
    # parse :exp, "(((kitties()))", [:functioncall, :kitties, []]
    # parse :exp, "kitties(puppies(iguanas()))"
    # p = Lupin::Parser.new("1+1")
    # assert p.parse('exp')
    # assert p.result, [:+, 1, 1]
    # parse "(1+1)", :exp
    # parse "1-1.0", :exp
    # parse "1/10", :exp
    # parse "1*100e100", :exp
    # parse "...", :exp # How is this used? :-D
    # parse "puppies(1+1,\"woof\")", :exp
    # parse "some_var", :exp
    # parse "(funky_func(1+1))", :exp
    # parse "+++"
  end

  def test_bad
    # no_parse :exp, "-"
    # no_parse :exp, "*"
    # # Excessive? :-D
    # no_parse :exp, "((((((((((((((((kitties())))))))))))))))"
  end
end