require_relative 'test_helper'

class CheckMatchingBracketsTest < Minitest::Test
  def test_return_true_for_nil_string
    #skip
    assert Algorithms::check_matching_brackets
  end

  def test_return_true_for_string_with_no_brackets
    #skip
    assert Algorithms::check_matching_brackets("abcdefg")
  end

  def test_find_all_indexes_of_brackets
    skip
    check = "ab{af[s]as(ad)a}"

    assert_equal [2,5,7,10,13,15], Algorithms::check_matching_brackets(check)
  end

  def test_return_false_for_odd_number_brackets
    #skip
    check = "ab{af[s]as(ad)a"
    assert_equal false, Algorithms::check_matching_brackets(check)
  end

  def test_match_braces
    #skip
    check = "asd{asdf}asd"
    assert Algorithms::check_matching_brackets(check)
  end

  def test_match_parentheses
    #skip
    check = "asd(asdf)asd"
    assert Algorithms::check_matching_brackets(check)
  end

  def test_match_brackets
    #skip
    check = "asd[asdf]asd"
    assert Algorithms::check_matching_brackets(check)
  end

  def test_match_brackets_paraentheses_braces
    #skip
    check = "a{sd[a(sd)f]asd}"
    assert Algorithms::check_matching_brackets(check)
  end

  def test_single_bracket_type_mismatch
    #skip
    check = "a{sdaf]"
    refute Algorithms::check_matching_brackets(check)
  end

  def test_multi_bracket_type_mismatch
    #skip
    check = "[a{sdaf]asdf)"
    refute Algorithms::check_matching_brackets(check)
  end

  def test_separated_brackets_parentheses
    #skip
    check = "as(ds)asd[as]"
    assert Algorithms::check_matching_brackets(check)
  end

  def test_separated_brackets_with_enclosed_brackets_simple
    check = "a{s(ds)as}d[as]"
    assert Algorithms::check_matching_brackets(check)
  end

  def test_separated_brackets_with_enclosed_brackets_complex
    check = "a{s(ds)as}dhj{sdf[as]s}"
    assert Algorithms::check_matching_brackets(check)
  end

  def test_really_long_string_with_mismatched_brackets
    check = "aa}sdf{as(d)f{s(ds)as}dhj{sdf[as]sasdf}asdasdf(s}dfa{s[dfasdf)a)sdfs}afs[dfs)dfasdfsadff"
    refute Algorithms::check_matching_brackets(check)
  end

  def test_really_long_string_with_matched_brackets
    check = "as{sdaf[g(ffsa)f]as}asdf{fdas[asdf(asd)ad(fd)s(sdf)adsf]sdf}"
    assert Algorithms::check_matching_brackets(check)
  end


end
