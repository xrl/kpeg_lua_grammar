require "test/unit"
require './test/helper_methods'

class FunctioncallTest < Test::Unit::TestCase
  include TestHelperMethods

  def test_parse
    assert_nothing_raised do
      parse "invokeme()", :functioncall
    end
    assert_nothing_raised do
      parse "so_true(false)", :functioncall
    end
    assert_nothing_raised do
      parse "set_bank_balance(nil)", :functioncall
    end
    assert_nothing_raised do
    #  parse "evaluate_expression((1+1))", :functioncall
    end
  end

  def test_bad
    assert_raise RuntimeError do
      raise RuntimeError
    end
  end
end
