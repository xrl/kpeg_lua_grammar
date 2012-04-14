require "minitest/autorun"
require "test/helper_methods"

class PrefixexpTest < MiniTest::Unit::TestCase
  def test_parse
    parse :prefixexp, "(nil)", [:lit,nil]
    parse :prefixexp, "some_var", [:name,:some_var]
    parse :prefixexp, "kitties()", [:functioncall,[:name,:kitties],[]]
  end

  def test_bad
  end
end
