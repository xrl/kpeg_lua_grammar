require "test/unit"
require './test/helper_methods'

class CommentsTest < Test::Unit::TestCase
  include TestHelperMethods
  
  def test_comments
    assert_nothing_raised do
      parse "--foo\n", :comment
      parse "--foo", :comment  # end-of-file
      parse "-- foo\n", :comment
      parse "---foo\n", :comment
      parse "-- [[foo\n", :comment

      parse "--[[foo]]", :comment
      parse "--[[foo\nbar]]", :comment
      parse "--[=[foo]=bar]=]", :comment
      
      parse "--[=[foo]=comment\n\n\n]=]", :comment
      parse "--[=[foo]=\n\n\ncomment]=]", :comment
      parse "--[=[foo]=\n\n\ncomment\n\n\n]=]", :comment
    end
  end
  
  def test_bad_comments
    assert_raise RuntimeError do
      parse "-foo\n", :comment
      parse "--[=[foo]==]", :comment
    end
  end
end
