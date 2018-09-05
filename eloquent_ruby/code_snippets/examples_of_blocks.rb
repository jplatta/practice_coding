module Examples
  def do_something
    yield if block_given? 
  end

  def test_dumb_block
    do_something do 
      puts "Hello from inside the block"
    end    
  end
end