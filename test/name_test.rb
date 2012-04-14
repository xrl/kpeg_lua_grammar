require "minitest/autorun"
require "test/helper_methods"

class NameTest < MiniTest::Unit::TestCase
  def test_names
    parse :name, "someName", :someName
    parse :name, "HITHERE",  :HITHERE
    parse :name, "_Leading", :_Leading
    parse :name, "_LEADING", :_LEADING
    parse :name, "Has3Numbers94", :Has3Numbers94
  end
  
  def test_bad_names
    no_parse :name, "0"
    no_parse :name, "$"
    no_parse :name, "0badname"
    no_parse :name, "no spaces allowed"
    no_parse :name, "   leading_spaces_bad"
  end
end
