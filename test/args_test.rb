require "test/unit"
require './test/helper_methods'

class ArgsTest < Test::Unit::TestCase
  include TestHelperMethods

  def test_parse
    parse :args, "()", [:args, []]
    parse :args, "((nil))", [:args, [:explist, [:lit, nil]]]
    parse :args, "(nil, false , true )", [:args, [:explist, [[:lit,nil],[:lit,false],[:lit,true]]]]
    parse :args, "(nil,(false))", [:args, [:explist, [[:lit, nil],[:lit, false]]]]
  end

  def test_bad
    no_parse :args, "(nil,)"
    no_parse :args, "(,nil,)"
  end
end
