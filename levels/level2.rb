get '/level2' do
  @tweets = DB.fetch("SELECT * FROM tweets WHERE private= 'false'")
  haml :level2
end

post '/level2' do
  handle = params['handle']
  @tweets = DB.fetch("SELECT * FROM tweets WHERE handle = '#{handle}' AND private= 'false'")
end

get '/level2/load' do
  load_level2
end

get '/level2/reset' do
  reset_level2
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


