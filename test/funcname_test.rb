require "test/unit"
require './test/helper_methods'

class FuncnameTest < Test::Unit::TestCase
  include TestHelperMethods

  def test_funcnames
    assert_nothing_raised do
      parse :funcname, "asdf"
      parse :funcname, "____"
      parse :funcname, "_FUNKY"
      parse :funcname, "this.is:funky"
      parse :funcname, "_._._"
    end
  end

  def test_bad
    assert_raise RuntimeError do
      parse "s:o:wrong", :funcname
    end
    assert_raise RuntimeError do
      parse "++++", :funcname
    end
    assert_raise RuntimeError do
      parse "+++asdf", :funcname
    end
    assert_raise RuntimeError do
      parse "8888", :funcname
    end
    assert_raise RuntimeError do
      parse "234-234", :funcname
    end
    assert_raise RuntimeError do
      parse "a.s.d:", :funcname
    end
  end
end
