$: << File.dirname(File.join(__FILE__,"../lib"))

require 'test/unit'
require 'rubygems'
require 'kpeg'
require 'grammar.kpeg'

class AstTest < Test::Unit::TestCase
  def test_ast_generation
    expression = "result"
    parser = LupinParser.new(expression)
    success = parser.parse('name')
    raise success.to_s + "  " + parser.inspect
  end
end