require "test/unit"
require './test/helper_methods'

class PrefixexpTest < Test::Unit::TestCase
  include TestHelperMethods

  def test_parse
    assert_nothing_raised do
      parse "(nil)", :prefixexp
    end
    assert_nothing_raised do
      parse "some_var", :prefixexp
    end
    assert_nothing_raised do
      # parse "hey()", :prefixexp
    end
  end

  def test_bad
    assert_raise RuntimeError do
      raise
    end
  end
end
