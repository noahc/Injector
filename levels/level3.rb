get '/level3' do
  haml :level3
end

post '/level3/signup' do
  username = params['username']
  password = params['password']
  DB.fetch("INSERT INTO users (username, password, admin) VALUES  ('#{username}', '#{password}', false)")
end

post '/level3/signin' do
username = params['username']
  password = params['password']
  user = DB.fetch("SELECT * FROM users WHERE username = '#{username}' AND password= '#{password}'").first
  # jack', 'jane', 'true') -- 
  "Logged in as #{user[:username]} with admin flag set as #{user[:admin]}"
end



