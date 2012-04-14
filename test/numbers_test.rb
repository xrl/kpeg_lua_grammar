require "minitest/unit"
require "test/helper_methods"

class NumbersTest < MiniTest::Unit::TestCase
  def test_numbers
    parse :number, "0123456789.0123456789", [:number,123456789.0123456789]
    parse :number, "9e1", [:number,9e1]
    parse :number, "9E1", [:number,9E1]
    parse :number, "0.42", [:number,0.42]
    parse :number, "42e+2", [:number,42e+2]
    parse :number, "42e-1", [:number,42e-1]
    parse :number, "0x1234567890AbCdEf", [:number,0x1234567890AbCdEf]
    parse :number, "9.", [:number,9.0]
    parse :number, ".42", [:number,0.42]
  end
  
  def test_bad_numbers
    no_parse :number, "."
    no_parse :number, "0xG"
    no_parse :number, "FF"
    no_parse :number, "9.+e1"
  end
end
