require "test/unit"
require './test/helper_methods'

class CommentsTest < Test::Unit::TestCase
  include TestHelperMethods
  
  def test_comments
    assert_nothing_raised do
      parse :comment, "--foo\n", [:comment, "foo"]
      parse :comment, "--foo", [:comment, "foo"]
      parse :comment, "-- foo\n", [:comment, " foo"]
      parse :comment, "---foo\n", [:comment, "-foo"]
      parse :comment, "-- [[foo\n", [:comment, " [[foo"]

      parse :comment, "--[[foo]]", [:comment, "foo"]
      parse :comment, "--[[foo\nbar]]", [:comment, "foo\nbar"]
      parse :comment, "--[=[foo]=bar]=]", [:comment, "foo]=bar"]
      
      parse :comment, "--[=[foo]=comment\n\n\n]=]", [:comment,"foo]=comment\n\n\n"]
      parse :comment, "--[=[foo]=\n\n\ncomment]=]", [:comment,"foo]=\n\n\ncomment"]
      parse :comment, "--[=[foo]=\n\n\ncomment\n\n\n]=]", [:comment,"foo]=\n\n\ncomment\n\n\n"]
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
