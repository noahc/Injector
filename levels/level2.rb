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


