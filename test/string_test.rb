require "test/unit"
require './test/helper_methods'

class StringTest < Test::Unit::TestCase
  include TestHelperMethods
  
  def test_strings
    assert_nothing_raised do
      parse :string, %Q{'foobar'}, [:string, "foobar"]
      parse :string, %Q{'foo\\'bar'}, [:string, %Q{foo\\'bar}]
      parse :string, %Q{'foo\\\nbar'}, [:string, %Q{foo\\\nbar}]
      parse :string, %Q{'foo"bar'}, [:string, %Q{foo\"bar}]
    end
    
    assert_nothing_raised do
      parse :string, %Q{"foobar"}, [:string,%Q{foobar}]
      parse :string, %Q{"foo\\\"bar"}, [:string,%Q{foo\\\"bar}]
      parse :string, %Q{"foo\\\nbar"}, [:string,%Q{foo\\\nbar}]
      parse :string, %Q{"foo'bar"}, [:string,%Q{foo'bar}]
    end
    
    assert_nothing_raised do
      parse :string, "[[foo]]", [:string,%Q{foo}]
      parse :string, "[=[foo]]bar]=]", [:string,%Q{foo]]bar}]
      parse :string, "[[foo'bar\"\nbaz]]", [:string,%Q{foo'bar\"\nbaz}]
    end
  end
  
  def test_bad_strings
    assert_raise Test::Unit::AssertionFailedError do
      parse :string, "'foo bar", [:string, %Q{'foo bar}]
      parse :string, "'foo\nbar'", [:string, %Q{'foo\nbar'}]
    end
    
    assert_raise Test::Unit::AssertionFailedError do
      parse :string, "\"foo bar", [:string, %Q{}]
      parse :string, "\"foo\nbar\"", [:string,%Q{}]
    end
    
    assert_raise Test::Unit::AssertionFailedError do
      parse :string, "[[foo bar", [:string, %Q{}]
      parse :string, "[=[foo]]", [:string, %Q{}]
    end
  end
end
