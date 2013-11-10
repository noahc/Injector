require 'sinatra'
require 'sequel'
require 'haml'
require 'securerandom'
require 'logger'
require './levels/level1.rb'
require './levels/level2.rb'

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

def reset_level8
  DB.drop_table :documents
  DB.create_table :documents do
     primary_key :id
     String :name
     String :filename
     String :mimetype
     String :sessid
  end

  5.times do
    sessid = SecureRandom.hex
    5.times do |n|
      documents.insert( name: "name#{n}", filename: "filename#{n}", mimetype: "text/plain", sessid: sessid)
    end
  end
end
