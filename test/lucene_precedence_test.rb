
require "test/unit"
require File.expand_path("../../lib/lucene_precedence", __FILE__)

class LucenePrecedenceTest < Test::Unit::TestCase
  def test_fix
    assert_equal "( a OR b ) c", LucenePrecedence.fix("a OR b c")
    assert_equal "( a OR ( b c ) )", LucenePrecedence.fix("a OR (b c)")
    assert_equal "( ( a b ) OR c )", LucenePrecedence.fix("(a b) OR c")
    assert_equal "( a OR \" b c \" )", LucenePrecedence.fix("a OR \"b c\"")
    assert_equal "( \" a b \" OR c )", LucenePrecedence.fix("\"a b\" OR c")
    assert_equal "a ( ( b OR c ) ) d", LucenePrecedence.fix("a (b OR c) d")
    assert_equal "a ( ( ( b OR c ) ) OR d )", LucenePrecedence.fix("a (b OR c) OR d")
    assert_equal "a ( ( ( ( b OR c ) ) OR d ) ) e", LucenePrecedence.fix("a ((b OR c) OR d) e")
    assert_equal "a ( b OR -c )", LucenePrecedence.fix("a b OR -c")
    assert_equal "a ( b OR - c )", LucenePrecedence.fix("a b OR - c")
    assert_equal "a ( ( b OR c ) ) - d e", LucenePrecedence.fix("a (b OR c) - d e")
  end
end

