require "minitest/autorun"
require "test/helper_methods"

class VarlistTest < MiniTest::Unit::TestCase
  def test_varlists
    parse :varlist, "var1", [:varlist,[[:name,:var1]]]
    parse :varlist, "var1,var2", [:varlist,[[:name,:var1],[:name,:var2]]]
    parse :varlist, "var1, var2, var3", [:varlist, [[:name,:var1],[:name,:var2],[:name,:var3]]]
  end

  def test_bad
    no_parse :varlist, "some_method var2"
  end
end
