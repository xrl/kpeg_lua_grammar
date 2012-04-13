require "test/unit"
require './test/helper_methods'

class NameTest < Test::Unit::TestCase
  include TestHelperMethods
  
  def test_names
    assert_nothing_raised do
      parse :name, "someName", [:name,:someName]
      parse :name, "HITHERE", [:name, :HITHERE]
      parse :name, "_Leading", [:name, :_Leading]
      parse :name, "_LEADING", [:name, :_LEADING]
      parse :name, "Has3Numbers94", [:name, :Has3Numbers94]
    end
  end
  
  def test_bad_names
    assert_raise RuntimeError do
      parse :name, "0", nil
    end
    assert_raise RuntimeError do
      parse :name, "$", nil
    end
    assert_raise RuntimeError do
      parse :name, "0badname", nil
    end
    assert_raise RuntimeError do
      parse :name, "no spaces allowed", nil
    end
    assert_raise RuntimeError do
      parse :name, "   leading_spaces_bad", nil
    end
  end
end
