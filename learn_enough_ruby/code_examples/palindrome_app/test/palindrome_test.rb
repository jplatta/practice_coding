require_relative 'test_helper'

class PalindromeAppTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_form_presence
    get '/palindrome'
    assert doc(last_response).at_css('form')
  end

  def test_palindrome
    post '/check', phrase: 'racecar'
    assert_includes doc(last_response).at_css('p').text, "is a palindrome"
  end

  def test_not_palindrome
    post '/check', phrase: 'is not a palindrome'
    assert_includes doc(last_response).at_css('p').text, "is not a palindrome"
    assert doc(last_response).at_css('form')
  end
end