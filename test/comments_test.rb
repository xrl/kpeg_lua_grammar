require "minitest/unit"
require "test/helper_methods"

class CommentsTest < MiniTest::Unit::TestCase
  def test_comments
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
  
  def test_bad_comments
    no_parse :comment, "-foo\n"
    no_parse :comment, "--[=[foo]==]"
  end
end
