require 'sinatra'
require 'sequel'
require 'haml'
require 'securerandom'
require 'logger'

DB = Sequel.postgres('breaker101', user: 'breaker101', 
                                   password: 'br3ak3r101', 
                                   host: 'localhost',  
                                   loggers: [Logger.new($stdout)])
get '/' do
   haml :index 
end

get '/reset' do
  reset_level6
  reset_level7
  reset_level8
end

post '/level1' do
  username = params['username']
  password = params['password']
  "logged in successfully" unless DB.fetch("SELECT * FROM users WHERE username = '#{username}' AND password= '#{password}'").empty?
end

get '/reset/level1' do
  reset_level1
end
  
get '/forms/level6' do
  haml :level6
end

get '/view/level6' do
 haml :view_level6
end

get '/reset/level6' do
  reset_level6
end


get '/forms/level7' do
  haml :level7
end

get '/view/level7' do
 haml :view_level7
end

get '/reset/level7' do
  reset_level7
end

get '/forms/level8' do
  haml :level8
end

get '/view/level8' do
 haml :view_level8
end

get '/reset/level8' do
  reset_level8
end

def load_level1
  DB.create_table :users do
    primary_key :id
    String :username
    String :password
  end
  users =  DB[:users]
  users.insert(username: "admin", password: "admin")
  users.insert(username: "noah", password: "miamidolphins")
end

def reset_level1
  DB.drop_table :users
  DB.create_table :users do
    primary_key :id
    String :username
    String :password
  end
  users =  DB[:users]
  users.insert(username: "admin", password: "admin")
  users.insert(username: "noah", password: "miamidolphins")
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
