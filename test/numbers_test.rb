require "test/unit"
require './test/helper_methods'

class NumbersTest < Test::Unit::TestCase
  include TestHelperMethods
  
  def test_numbers
    assert_nothing_raised do
      parse :number, "0123456789.0123456789", [:number,123456789.0123456789]
      parse :number, "9e1", [:number,9e1]
      parse :number, "9E1", [:number,9E1]
      parse :number, "0.42", [:number,0.42]
      parse :number, "42e+2", [:number,42e+2]
      parse :number, "42e-1", [:number,42e-1]
    end
    
    assert_nothing_raised do
      parse :number, "0x1234567890AbCdEf", [:number,0x1234567890AbCdEf]
    end

    assert_nothing_raised do
      # TODO: Twisol! On you!
      # parse "9.", :number
    end
    
    assert_nothing_raised do
      # TODO: Twisol! On you!
      # parse ".42", :number
    end
  end
  
  def test_bad_numbers
    assert_raise Test::Unit::AssertionFailedError do
      parse :number, ".", nil
    end
    
    assert_raise Test::Unit::AssertionFailedError do
      parse :number, "9.+e1", nil
    end
    
    assert_raise Test::Unit::AssertionFailedError do
      parse :number, "0xG", nil
    end
    
    assert_raise Test::Unit::AssertionFailedError do
      parse :number, "FF", nil
    end
  end
end
