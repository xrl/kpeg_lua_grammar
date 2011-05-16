$: << File.dirname(File.join(__FILE__,"../lib"))

require "test/unit"
require './test/helper_methods'

class CommentsTest < Test::Unit::TestCase
  include TestHelperMethods
  
  def test_comments
    parses_to_result("--foo\n", :comment)
    parses_to_result("--foo", :comment) # end-of-file
    parses_to_result("-- foo\n", :comment)
    parses_to_result("---foo\n", :comment)
    parses_to_result("-- [[foo\n", :comment)
    
    parses_to_result("--[[foo]]", :comment)
    parses_to_result("--[[foo\nbar]]", :comment)
    parses_to_result("--[=[foo]=bar]=]", :comment)
  end
  
  def test_bad_comments
    doesnt_parse_to_result("-foo\n", :comment)
    doesnt_parse_to_result("--[=[foo]==]", :comment)
  end
end
