require "minitest/unit"
require "test/helper_methods"

class StringTest < MiniTest::Unit::TestCase
  def test_strings
    parse :string, %Q{'foobar'}, [:string, "foobar"]
    parse :string, %Q{'foo\\'bar'}, [:string, %Q{foo\\'bar}]
    parse :string, %Q{'foo\\\nbar'}, [:string, %Q{foo\\\nbar}]
    parse :string, %Q{'foo"bar'}, [:string, %Q{foo\"bar}]
    
    parse :string, %Q{"foobar"}, [:string,%Q{foobar}]
    parse :string, %Q{"foo\\\"bar"}, [:string,%Q{foo\\\"bar}]
    parse :string, %Q{"foo\\\nbar"}, [:string,%Q{foo\\\nbar}]
    parse :string, %Q{"foo'bar"}, [:string,%Q{foo'bar}]
    
    parse :string, "[[foo]]", [:string,%Q{foo}]
    parse :string, "[=[foo]]bar]=]", [:string,%Q{foo]]bar}]
    parse :string, "[[foo'bar\"\nbaz]]", [:string,%Q{foo'bar\"\nbaz}]
  end
  
  def test_bad_strings
    no_parse :string, "'foo bar"
    no_parse :string, "'foo\nbar'"
    no_parse :string, "\"foo bar"
    no_parse :string, "\"foo\nbar\""

    no_parse :string, "[[foo bar"
    no_parse :string, "[=[foo]]"
  end
end
