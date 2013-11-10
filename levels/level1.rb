get '/level1' do
  haml :level1
end

post '/level1' do
  username = params['username']
  password = params['password']
  DB.fetch("SELECT * FROM users WHERE username = '#{username}' AND password= '#{password}'").empty? ? "Failed Login." : "Successful Login."
end

get 'level1/solutions' do
end

