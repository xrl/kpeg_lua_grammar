require "test/unit"
require './test/helper_methods'

class ExpTest < Test::Unit::TestCase
  include TestHelperMethods

  def test_parse
    assert_nothing_raised do
      parse :exp, "nil", [:lit, nil]
    end
    assert_nothing_raised do
      parse :exp, "false", [:lit, false]
    end
    assert_nothing_raised do
      parse :exp, "true", [:lit, true]
    end
    assert_nothing_raised do
      parse :exp, "1", [:number, 1.0]
    end
    assert_nothing_raised do
      parse :exp, %Q{"kitties"}, [:string, "kitties"]
    end
    assert_nothing_raised do
      # Rubinius::Debugger.start
      parse :exp, "kitties()", [:prefixexp, [:functioncall, :kitties, []]]
    end
    assert_nothing_raised do
      parse :exp, "(kitties())", [:prefixexp, [:functioncall, :kitties, []]]
    end
    # assert_nothing_raised do
    #   parse :exp, "(((kitties()))", [:prefixexp, [:functioncall, :kitties, []]]
    # end
    # assert_nothing_raised do
    #   parse "kitties(puppies(iguanas()))", :exp
    # end
    # assert_nothing_raised do
    #   p = Lupin::Parser.new("1+1")
    #   assert p.parse('exp')
    #   assert p.result, [:+, 1, 1]
    # end
    # assert_nothing_raised do
    #   parse "(1+1)", :exp
    # end
    # assert_nothing_raised do
    #   parse "1-1.0", :exp
    # end
    # assert_nothing_raised do
    #   parse "1/10", :exp
    # end
    # assert_nothing_raised do
    #   parse "1*100e100", :exp
    # end
    # assert_nothing_raised do
    #   parse "...", :exp # How is this used? :-D
    # end
    # assert_nothing_raised do
    #   parse "puppies(1+1,\"woof\")", :exp
    # end
    # assert_nothing_raised do
    #   parse "some_var", :exp
    # end
    # assert_nothing_raised do
    #   parse "(funky_func(1+1))", :exp
    # end
    # assert_nothing_raised do
    #   parse "+++"
    # end
  end

  def test_bad
    assert_raise RuntimeError do
      raise
      # parse "-", :exp
      # parse "*", :exp
    end
    assert_raise RuntimeError do
      raise
      # Excessive? :-D
      # parse "((((((((((((((((kitties())))))))))))))))", :exp
    end
  end
end
