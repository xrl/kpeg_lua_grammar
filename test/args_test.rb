require "minitest/unit"
require "test/helper_methods"

class ArgsTest < MiniTest::Unit::TestCase
  def test_parse
    parse :args, "()", []
    parse :args, "((nil))", [[:lit, nil]]
    parse :args, "(nil, false , true )", [[:lit,nil],[:lit,false],[:lit,true]]
    parse :args, "(nil,(false))", [[:lit, nil],[:lit, false]]
  end

  def test_bad
    no_parse :args, "(nil,)"
    no_parse :args, "(,nil,)"
  end
end
