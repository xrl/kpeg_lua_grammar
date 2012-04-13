require "test/unit"
require './test/helper_methods'

class ArgsTest < Test::Unit::TestCase
  include TestHelperMethods

  def test_parse
    assert_nothing_raised do
      parse :args, "()", [:args, []]
    end
    assert_nothing_raised do
      parse :args, "((nil))", [:args, [:explist, [:lit, nil]]]
    end
    assert_nothing_raised do
      parse :args, "(nil, false , true )", [:args, [:explist, [[:lit,nil],[:lit,false],[:lit,true]]]]
    end
    assert_nothing_raised do
      parse :args, "(nil,(false))", [:args, [:explist, [[:lit, nil],[:lit, false]]]]
    end
  end

  def test_bad
    assert_raise Test::Unit::AssertionFailedError do
      parse :args, "(nil,)", [:args, [:explist, [[:lit,nil],[:lit,nil]] ]]
    end
    assert_raise Test::Unit::AssertionFailedError do
      parse :args, "(,nil,)", :whatever
    end
  end
end
