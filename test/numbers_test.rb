require "test/unit"
require './test/helper_methods'

class NumbersTest < Test::Unit::TestCase
  include TestHelperMethods
  
  def test_numbers
    assert_nothing_raised do
      parse "0123456789.0123456789", :number
      parse "9e1", :number
      parse "9E1", :number
      parse "0.42", :number
      parse "42e+2", :number
      parse "42e-1", :number
    end
    
    assert_nothing_raised do
      parse "0x1234567890AbCdEf", :number
    end
  end
  
  def test_bad_numbers
    assert_raise RuntimeError do
      # Twisol had this as acceptable.
      # http://www.lua.org/manual/5.1/manual.html#2.1
      # Those example don't accept it -- and I'm used to ruby notation.
      # Will accept code in the wild as a counter point :-D
      parse "9.", :number
    end
    
    assert_raise RuntimeError do
      parse "9.+e1", :number
    end
    
    assert_raise RuntimeError do
      parse ".42", :number
    end
    
    assert_raise RuntimeError do
      parse ".", :number
    end
    
    assert_raise RuntimeError do
      parse "0xG", :number
    end
    
    assert_raise RuntimeError do
      parse "FF", :number
    end
  end
end
