require 'sinatra'
require './day'
require 'pry'

get '/' do
  #ebinding.pry
  #raise "An error has occurred!"
  "Hello, world! Happy #{day_of_the_week(Time.now)}."
end

get '/greeting' do
  greeting(Time.now)
end