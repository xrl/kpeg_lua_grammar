require "test/unit"
require './test/helper_methods'

class CommentsTest < Test::Unit::TestCase
  include TestHelperMethods
  
  def test_comments
    assert_nothing_raised do
      parse :comment, "--foo\n", nil
      parse :comment, "--foo", nil
      parse :comment, "-- foo\n", nil
      parse :comment, "---foo\n", nil
      parse :comment, "-- [[foo\n", nil

      parse :comment, "--[[foo]]", [:string, "foo"]
      parse :comment, "--[[foo\nbar]]", [:string, "foo\nbar"]
      parse :comment, "--[=[foo]=bar]=]", [:string, "bar"]
      
      parse :comment, "--[=[foo]=comment\n\n\n]=]", nil
      parse :comment, "--[=[foo]=\n\n\ncomment]=]", nil
      parse :comment, "--[=[foo]=\n\n\ncomment\n\n\n]=]", nil
    end
  end
  
  def test_bad_comments
    assert_raise Test::Unit::AssertionFailedError do
      parse :comment, "-foo\n", :comment
    end
    assert_raise Test::Unit::AssertionFailedError do
      parse :comment, "--[=[foo]==]", :comment
    end
  end
end
