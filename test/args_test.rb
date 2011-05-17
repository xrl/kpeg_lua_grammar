require "test/unit"
require './test/helper_methods'

class ArgsTest < Test::Unit::TestCase
  include TestHelperMethods

  def test_parse
    assert_nothing_raised do
      parse "()", :args
    end
    assert_nothing_raised do
      parse "(nil)", :args
    end
    assert_nothing_raised do
      parse "(nil,nil)", :args
    end
    assert_nothing_raised do
      parse "(nil, nil )", :args
    end
  end

  def test_bad
    assert_raise RuntimeError do
      parse "(nil,)", :args
    end
    assert_raise RuntimeError do
      parse "(,nil,)", :args
    end
  end
end
