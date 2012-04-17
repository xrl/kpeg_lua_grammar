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
    parse :exp, "(kitties())", [:functioncall, [:name, :kitties], []]
    parse :exp, "((kitties()))", [:functioncall, [:name, :kitties], []]
    parse :exp, "kitties(puppies(iguanas()))", [:functioncall, [:name, :kitties], [[:functioncall, [:name, :puppies], [[:functioncall, [:name, :iguanas], []]]]]]
    parse :exp, "some_var", [:name,:some_var]
    parse :exp, "1/10", []
    parse :exp, "1-1.0", []
    parse :exp, "(1+1)", :whut
    parse :exp, "1*100e100", []
    parse :exp, "...", :varargs # How is this used? :-D
    parse :exp, "puppies(1+1,\"woof\")", []
    parse :exp, "(funky_func(1+1))", []
    parse :exp, "+++", [] # Is this valid?
  end
end