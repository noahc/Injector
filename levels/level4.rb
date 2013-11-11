get '/level4'  do
  @documents= DB.fetch("SELECT * FROM documents")
  haml :level4    
end

post '/level4' do
end
