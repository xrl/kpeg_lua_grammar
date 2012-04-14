require "minitest/autorun"
require "test/helper_methods"

class FunctioncallTest < MiniTest::Unit::TestCase
  def test_parse
    parse :functioncall, "kitties()", [:functioncall, [:name, :kitties], []]
    parse :functioncall, "invokeme()", [:functioncall, [:name, :invokeme], []]
    parse :functioncall, "so_true(false)", [:functioncall, [:name, :so_true], [[:lit,false]]]
    parse :functioncall, "set_bank_balance(nil)", [:functioncall, [:name, :set_bank_balance], [[:lit,nil]]]
    parse :functioncall, "evaluate_expression(100)", [:functioncall, [:name, :evaluate_expression], [[:number,100]]]
    parse :functioncall, "evaluate_expression(\"yessir\")", [:functioncall, [:name, :evaluate_expression], [[:string,"yessir"]]]
    parse :functioncall, "evaluate_expression(...)", [:functioncall, [:name, :evaluate_expression], [[:varargs]]]
    parse :functioncall, "evaluate_expression(somevar)", [:functioncall, [:name, :evaluate_expression], [[:name,:somevar]]]
  end

  def test_bad
  end
end
