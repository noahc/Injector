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

def reset_level2
  DB.drop_table :tweets
  load_level2
end
  
def load_level2
  DB.create_table :tweets  do
    primary_key :id
    String :handle
    String :text
    Boolean :private
  end
  tweets =  DB[:tweets]
  tweets.insert(handle: "@elpresident",
               text: "Illegal spying is not just a threat to democracy, the American way, but a threat to my children, and my childrens children, and my....",
               private: "false")
   tweets.insert(handle: "@elpresident",
               text: "RT: @PatrickHenry -- Give me liberty, or give me death!",
              private: "false")

  tweets.insert(handle: "@elpresident",
               text: "Nothing like the smell of fresh illegally gathered intelligence reports with my coffee in the octagon office",
              private: "true")

end


