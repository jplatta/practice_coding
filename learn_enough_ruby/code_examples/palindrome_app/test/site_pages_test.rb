require_relative 'test_helper'

class PalindromeAppTest < Minitest::Test
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end

  def setup
    @base_title = 'Learn Enough Ruby Sample App'
  end

  def test_index
    get '/' 
    assert last_response.ok?
    assert doc(last_response).at_css('h1')
    title_content = doc(last_response).at_css('title').content
    assert_equal title_content, "#{@base_title} | Home"
    assert doc(last_response).at_css('nav')
  end
  
  def test_about
    get '/about'
    assert last_response.ok?
    assert doc(last_response).at_css('h1')
    title_content = doc(last_response).at_css('title').content
    assert_equal title_content, "#{@base_title} | About"
  end
  
  def test_palindrome_page
    get '/palindrome'
    assert last_response.ok?
    assert doc(last_response).at_css('h1')
    title_content = doc(last_response).at_css('title').content
    assert_equal title_content, "#{@base_title} | Palindrome Detector"
  end
end
