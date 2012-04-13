require "test/unit"
require './test/helper_methods'

class FunctioncallTest < Test::Unit::TestCase
  include TestHelperMethods

  def test_parse
    assert_nothing_raised do
      parse :functioncall, "invokeme()", [:functioncall, :invokeme, []]
    end
    assert_nothing_raised do
      parse :functioncall, "so_true(false)", [:functioncall, :so_true,[false]]
    end
    assert_nothing_raised do
      parse :functioncall, "set_bank_balance(nil)", [:functioncall, :set_bank_balance, [nil]]
    end
    assert_nothing_raised do
      parse :functioncall, "evaluate_expression(100)", [:functioncall, :evalute_expression, [100]]
    end
    assert_nothing_raised do
      parse :functioncall, "evaluate_expression(\"yessir\")", [:functioncall, :evalute_expression, ["yessir"]]
    end
    assert_nothing_raised do
      parse :functioncall, "evaluate_expression(...)", [:functioncall,:evaluate_expression,[:ellipsis]]
    end
    assert_nothing_raised do
      parse :functioncall, "evaluate_expression(somevar)", [:functioncall,:evaluate_expression,[:var,:somevar]]
    end
  end

  def test_bad
    assert_raise RuntimeError do
      raise RuntimeError
    end
  end
end
