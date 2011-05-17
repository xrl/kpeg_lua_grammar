require "test/unit"
require './test/helper_methods'

class NameTest < Test::Unit::TestCase
  include TestHelperMethods
  
  def test_names
    assert_nothing_raised do
      parse "someName", :name
      parse "HITHERE", :name
      parse "_Leading", :name
      parse "_LEADING", :name
      parse "Has3Numbers94", :name
    end
  end
  
  def test_bad_names
    assert_raise RuntimeError do
      parse "0", :name
    end
    assert_raise RuntimeError do
      parse "$", :name
    end
    assert_raise RuntimeError do
      parse "0badname", :name
    end
    assert_raise RuntimeError do
      parse "no spaces allowed", :name
    end
    assert_raise RuntimeError do
      parse "   leading_spaces_bad", :name
    end
  end
end
