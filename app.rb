require 'sinatra'
require 'sequel'
require 'haml'
require 'securerandom'
require 'logger'
require './levels/level1.rb'
require './levels/level2.rb'
require './levels/level3.rb'
require './levels/level4.rb'
require './tables/users.rb'
require './tables/tweets.rb'
require './tables/documents.rb'
require 'pry'
require 'pry-nav'

DB = Sequel.postgres('breaker101', user: 'breaker101', 
                                   password: 'br3ak3r101', 
                                   host: 'localhost',  
                                   loggers: [Logger.new($stdout)])
get '/' do
   haml :index 
end

get '/reset' do
  reset_level1
  reset_level2
  redirect '/'
end

get '/load' do
  load_level1
  load_level2
  redirect '/'
  # load_level2
end
