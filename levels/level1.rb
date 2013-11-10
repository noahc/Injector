get '/level1' do
  haml :level1
end

post '/level1' do
  username = params['username']
  password = params['password']
  puts params
  DB.fetch("SELECT * FROM users WHERE username = '#{username}' AND password= '#{password}'").empty? ? "Failed Login." : "Successful Login."
end

get '/level1/reset' do
  reset_level1
end

get '/level1/load' do
  load_level1
end

get 'level1/solutions' do
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
  load_level1
end


