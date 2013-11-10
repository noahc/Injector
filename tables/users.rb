get '/users/reset' do
  reset_users
  redirect '/'
end

get '/users/load' do
  load_users
  redirect '/'
end

def load_users
  DB.create_table :users do
    primary_key :id
    String :username
    String :password
    Boolean :admin
  end
  users =  DB[:users]
  users.insert(username: "admin", password: "admin", admin: true)
  users.insert(username: "noah", password: "miamidolphins", admin: false)
end

def reset_users
  DB.drop_table :users
  load_users
end


