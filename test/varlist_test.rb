require "test/unit"
require './test/helper_methods'

class VarlistTest < Test::Unit::TestCase
  include TestHelperMethods

  def test_varlists
    assert_nothing_raised do
      parse :varlist, "var1", [:varlist,[[:var,:var1]]]
    end
    assert_nothing_raised do
      parse :varlist, "var1,var2", [:varlist,[[:var,:var1],[:var,:var2]]]
    end
    assert_nothing_raised do
      parse "var1, var2", :varlist, [:varlist, [[:var,:var1],[:var,:var2]]]
    end
  end

  def test_bad
    assert_raise RuntimeError do
      parse :varlist, "some_method var2", nil
    end
  end
end
