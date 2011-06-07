require "test/unit"
require './test/helper_methods'

class FuncnameTest < Test::Unit::TestCase
  include TestHelperMethods

  def test_funcnames
    assert_nothing_raised do
      parse :funcname, "asdf", [:funcname, :asdf]
      parse :funcname, "____", [:funcname, :____]
      parse :funcname, "_FUNKY", [:funcname, :_FUNKY]
      parse :funcname, "this.is:funky", [:funcname, :"this.is:funky"]
      parse :funcname, "_._._", [:funcname, :"_._._"]
    end
  end

  def test_bad
    # assert_raise Test::Unit::AssertionFailedError do
    #   parse :funcname, "s:o:wrong", nil
    #   raise Test::Unit::AssertionFailedError
    # end
    # assert_raise Test::Unit::AssertionFailedError do
    #   parse :funcname, "++++", nil
    # end
    # assert_raise Test::Unit::AssertionFailedError do
    #   parse :funcname, "+++asdf", nil
    # end
    # assert_raise Test::Unit::AssertionFailedError do
    #   parse :funcname, "8888", nil
    # end
    # assert_raise Test::Unit::AssertionFailedError do
    #   parse :funcname, "234-234", nil
    # end
    # assert_raise Test::Unit::AssertionFailedError do
    #   parse :funcname, "a.s.d:", nil
    # end
  end
end
