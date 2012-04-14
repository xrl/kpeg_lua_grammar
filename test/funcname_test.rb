require "minitest/autorun"
require "test/helper_methods"

class FuncnameTest < MiniTest::Unit::TestCase
  def test_parse
    parse :funcname, "asdf", [:funcname, :asdf]
    parse :funcname, "____", [:funcname, :____]
    parse :funcname, "_FUNKY", [:funcname, :_FUNKY]
    parse :funcname, "this.is:funky", [:funcname, :"this.is:funky"]
    parse :funcname, "_._._", [:funcname, :"_._._"]
  end

  def test_bad
    no_parse :funcname, "++++"
    no_parse :funcname, "+++asdf"
    no_parse :funcname, "8888"
    no_parse :funcname, "234-234"
    no_parse :funcname, "s:o:wrong"
  end
end
