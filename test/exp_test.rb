require "test/unit"
require './test/helper_methods'

class ExpTest < Test::Unit::TestCase
  include TestHelperMethods

  def test_parse
    assert_nothing_raised do
      parse "nil", :exp
    end
    assert_nothing_raised do
      parse "false", :exp
    end
    assert_nothing_raised do
      parse "true", :exp
    end
    assert_nothing_raised do
      parse "1", :exp
    end
    assert_nothing_raised do
      parse %Q{"kitties"}, :exp
    end
    # assert_nothing_raised do
    #   parse "kitties()", :exp
    # end
    # assert_nothing_raised do
    #   parse "1+1", :exp
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
      parse "-", :exp
      parse "*", :exp
    end
  end
end
