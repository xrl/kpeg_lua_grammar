$: << File.dirname(File.join(__FILE__,"../lib"))

require "test/unit"
require './test/helper_methods'

class NameTest < Test::Unit::TestCase
  include TestHelperMethods
  
  def test_names
    parses_to_result("someName", :name)
    parses_to_result("HITHERE", :name)
    parses_to_result("_Leading", :name)
    parses_to_result("_LEADING", :name)
    parses_to_result("Has3Numbers94", :name)
  end
  
  def test_bad_names
    doesnt_parse_to_result("0", :name)
    doesnt_parse_to_result("$", :name)
  end
end
