require "test/unit"
require './test/helper_methods'

class StringTest < Test::Unit::TestCase
  include TestHelperMethods
  
  def test_strings
    assert_nothing_raised do
      parse "'foobar'", :string
      parse "'foo\\'bar'", :string
      parse "'foo\\\nbar'", :string
      parse "'foo\"bar'", :string
    end
    
    assert_nothing_raised do
      parse "\"foobar\"", :string
      parse "\"foo\\\"bar\"", :string
      parse "\"foo\\\nbar\"", :string
      parse "\"foo'bar\"", :string
    end
    
    assert_nothing_raised do
      parse "[[foo]]", :string
      parse "[=[foo]]bar]=]", :string
      parse "[[foo'bar\"\nbaz]]", :string
    end
  end
  
  def test_bad_strings
    assert_raise RuntimeError do
      parse "'foo bar", :string
      parse "'foo\nbar'", :string
    end
    
    assert_raise RuntimeError do
      parse "\"foo bar", :string
      parse "\"foo\nbar\"", :string
    end
    
    assert_raise RuntimeError do
      parse "[[foo bar", :string
      parse "[=[foo]]", :string
    end
  end
end
