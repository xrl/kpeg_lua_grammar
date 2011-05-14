$: << File.dirname(File.join(__FILE__,"../lib"))

require 'test/unit'
require 'rubygems'
require 'lupin'

class AstTest < Test::Unit::TestCase
  def parses_to_result(input,rule)
    parser = Lupin::Parser.new(input)
    assert(parser.parse)
    assert_equal(parser.result,input)
  end
  def doesnt_parse_to_result(input,rule)
    parser = Lupin::Parser.new(input)
    assert(!parser.parse)
    assert(parser.result == nil)
  end
  def test_names
    parses_to_result("someName",'name')
    parses_to_result("HITHERE",'name')
    parses_to_result("_Leading",'name')
    parses_to_result("_LEADING",'name')
  end
  def test_bad_names
    doesnt_parse_to_result("0",'name')
  end
end