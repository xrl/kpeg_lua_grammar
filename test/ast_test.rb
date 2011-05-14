$: << File.dirname(File.join(__FILE__,"../lib"))

require 'test/unit'

require 'rubygems'
require 'kpeg'
require 'grammar.kpeg'

class AstTest < Test::Unit::TestCase
  def test_ast_generation
    expression = "result = 1+1"
    parser = LupinParser.new(expression)
    parser.parse
    raise parser.inspect
  end
end