require 'sinatra'
require './db_connector'

get '/messages' do
    erb :message, locals: {
        color: 'DodgerBlue', 
        name: 'World'
    }
end

get '/messages/:name' do 
    name = params['name']
    color = params['color'] ? params['color'] : 'DodgerBlue'
    erb :message, locals: {
        color: color,
        name: name
    }
end

get '/login' do
    erb :form
end

post '/login' do 
    if params['username'] == 'admin' && params['password'] == 'admin'
        return 'Logged in!'
    else
        redirect '/login'
    end
end

# post '/create' do 
#     return params
# end

# get '/list_item' do
#     erb :list_item
# end


