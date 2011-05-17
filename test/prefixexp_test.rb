require "test/unit"
require './test/helper_methods'

class PrefixexpTest < Test::Unit::TestCase
  include TestHelperMethods

  def test_parse
    assert_nothing_raised do
    #  parse "(1+1)", :prefixexp
    end
  end

  def test_bad
    assert_raise RuntimeError do
      raise
    end
  end
end
