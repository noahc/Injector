get '/documents/reset' do
  reset_documents
  redirect '/'
end

get '/documents/load' do
  load_documents
  redirect '/'
end

def load_documents
  DB.create_table :documents do
     primary_key :id
     String :name
     String :filename
  end
  documents =  DB[:documents]
  documents.insert( name: 'file1.txt', filename: 'file1.txt')
  documents.insert( name: 'file1.txt', filename: 'file1.txt')
end

def reset_documents
  DB.drop_table :documents
  load_documents
end

  
